import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:registration/models/month_year_model.dart';
import 'package:registration/models/transaction_model.dart';
import '../../../models/user_model.dart';
import '../../../repositories/abstract_transaction_repository.dart';
import '../../../resources/enums/transaction_category.dart';
import '../../../resources/enums/transaction_type.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  final AbstractTransactionRepository repository;

  List<TransactionModel> _transactions = [];
  List<TransactionModel> _transactionsByMonth = [];
  List<TransactionModel> _transactionsByYear = [];
  MonthYear selectedMonth = MonthYear.fromDateTime(DateTime.now());
  int selectedYear = DateTime.now().year;

  TransactionsBloc({required this.repository})
      : super(TransactionsInitialState()) {
    on<TransactionAdd>(_onTransactionAdd);
    on<ReadinessChanged>(_onReadinessChanged);
    on<TransactionDelete>(_onTransactionDelete);
    on<TransactionEdit>(_onTransactionEdit);
    on<FetchEvent>(_onFetch);
    on<DateChanged>(_onDateChanged);
    on<FieldSubmitted>(_onFieldSubmitted);
  }

  Future<void> _onFetch(
      FetchEvent event, Emitter<TransactionsState> emit) async {
    _transactions = [];
    emit(FetchLoadingState());
    try {
      var allTransactions = await FirebaseFirestore.instance
          .collection('users')
          .doc(thisUser.username)
          .collection('transactions')
          .get();

      for (var i = 0; i < allTransactions.docs.length; i++) {
        var item = allTransactions.docs[i].data();
        _transactions.add(TransactionModel.fromJson(item));
      }
      _transactions.sort((a, b) => a.date!.compareTo(b.date!));
      _transactionsByMonth = _transactions
          .where(
              (tran) => repository.compareYearMonth(tran.date!, selectedMonth))
          .toList();
      _transactionsByYear = _transactions
          .where((tran) => tran.date!.year == selectedYear)
          .toList();
      emit(FetchState(
          transactionsByMonth: _transactionsByMonth,
          transactionsByYear: _transactionsByYear));
    } catch (e) {
      print(e);
    }
  }

  void _onDateChanged(DateChanged event, Emitter<TransactionsState> emit) {
    emit(FetchLoadingState());
    if (event.newMonth != null) {
      selectedMonth = event.newMonth!;
      _transactionsByMonth = _transactions
          .where(
              (tran) => repository.compareYearMonth(tran.date!, selectedMonth))
          .toList();
      emit(FetchState(
          transactionsByMonth: _transactionsByMonth,
          transactionsByYear: _transactionsByYear));
    } else {
      selectedYear = event.newYear!;
      _transactionsByYear = _transactions
          .where((tran) => tran.date!.year == selectedYear)
          .toList();
      emit(FetchState(
          transactionsByMonth: _transactionsByMonth,
          transactionsByYear: _transactionsByYear));
    }
  }

  Future<void> _onReadinessChanged(
    ReadinessChanged event,
    Emitter<TransactionsState> emit,
  ) async {
    var changed = await repository.changeReadinessTransaction(
        transaction: event.transaction, newValue: !event.transaction.ready);
    if (changed) {
      emit(ReadinessChangedState());
      add(FetchEvent());
    }
  }

  void _onFieldSubmitted(
    FieldSubmitted event,
    Emitter<TransactionsState> emit,
  ) {
    if (event.category != null) {
      prototypeTrans.category = event.category;
    }
    if (event.date != null) {
      prototypeTrans.date = event.date;
    }
    if (event.value != null) {
      prototypeTrans.value = event.value;
    }
    if (event.type != null) {
      prototypeTrans.type = event.type!;
    }
    if (event.ready != null) {
      prototypeTrans.ready = event.ready!;
    }
    if (event.description != null) {
      prototypeTrans.description = event.description;
    }
    if (prototypeTrans.fieldsCollected) {
      emit(FieldsCollectedState());
    }
  }

  Future<void> _onTransactionAdd(
    TransactionAdd event,
    Emitter<TransactionsState> emit,
  ) async {
    emit(TransactionLoadingState());

    bool addSuccess =
        await repository.addTransaction(transaction: prototypeTrans);

    prototypeTrans = TransactionModel(
        id: null,
        category: null,
        type: TransactionType.loss,
        ready: false,
        value: null,
        description: "",
        date: null);
    if (addSuccess) {
      emit(TransactionAddSuccessState());
      add(FetchEvent());
    } else {
      emit(TransactionAddFailedState());
    }
  }

  Future<void> _onTransactionDelete(
    TransactionDelete event,
    Emitter<TransactionsState> emit,
  ) async {
    bool deleteSuccess =
        await repository.deleteTransaction(transaction: event.transaction);
    if (deleteSuccess) {
      add(FetchEvent());
    } else {
      emit(TransactionDeleteFailedState());
    }
  }

  Future<void> _onTransactionEdit(
    TransactionEdit event,
    Emitter<TransactionsState> emit,
  ) async {
    emit(FetchLoadingState());

    bool editSuccess = await repository.editTransaction(
        id: prototypeTrans.id!,
        type: prototypeTrans.type,
        ready: prototypeTrans.ready,
        date: prototypeTrans.date!,
        category: prototypeTrans.category!,
        value: prototypeTrans.value!,
        description: prototypeTrans.description);

    prototypeTrans = TransactionModel(
        id: null,
        category: null,
        type: TransactionType.loss,
        ready: false,
        value: null,
        description: "",
        date: null);
    if (editSuccess) {
      emit(TransactionAddSuccessState());
      add(FetchEvent());
    } else {
      emit(TransactionEditFailedState());
    }
  }
}
