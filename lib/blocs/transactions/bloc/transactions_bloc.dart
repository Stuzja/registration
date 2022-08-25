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

  TransactionsBloc({required this.repository}) : super(TransactionsInitial()) {
    on<TypeSubmitted>(_onTypeSubmitted);
    on<ReadinessSubmitted>(_onReadinessSubmitted);
    on<CategorySubmitted>(_onCategorySubmitted);
    on<DateSubmitted>(_onDateSubmitted);

    on<TransactionAdd>(_onTransactionAdd);
    on<ReadinessChanged>(_onReadinessChanged);
    on<TransactionDelete>(_onTransactionDelete);
    on<TransactionEdit>(_onTransactionEdit);
    on<FetchEvent>(_onFetch);
    on<DateChanged>(_onDateChanged);
    on<FieldSubmitted>(_onFieldSubmitted);
  }

/*
  void _onTransactionsChanged(
    TransactionAdd event,
    Emitter<TransactionsState> emit,
  ) async {
    await emit.forEach(
        FirebaseFirestore.instance
            .collection('users')
            .doc(thisUser.username)
            .collection('transactions')
            .snapshots(), onData: ((data) {
      return TransactionAddSuccess();
    }));
  }
*/
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
      print("Возникла ошибка при загрузке транзакций");
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

  void _onTypeSubmitted(
    TypeSubmitted event,
    Emitter<TransactionsState> emit,
  ) {
    prototypeTrans.type = event.newValue;
  }

  void _onReadinessSubmitted(
    ReadinessSubmitted event,
    Emitter<TransactionsState> emit,
  ) {
    prototypeTrans.ready = event.newValue;
  }

  Future<void> _onReadinessChanged(
    ReadinessChanged event,
    Emitter<TransactionsState> emit,
  ) async {
    var changed = await repository.changeReadinessTransaction(
        transaction: event.transaction, newValue: !event.transaction.ready);
    if (changed) {
      emit(ReadinessChangedSuccess());
      add(FetchEvent());
    }
  }

  void _onCategorySubmitted(
    CategorySubmitted event,
    Emitter<TransactionsState> emit,
  ) async {
    prototypeTrans.category = event.newValue;
  }

  void _onDateSubmitted(
    DateSubmitted event,
    Emitter<TransactionsState> emit,
  ) {
    prototypeTrans.date = event.newValue;
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
    print(prototypeTrans.fieldsCollected);
    if (prototypeTrans.fieldsCollected) {
      emit(FieldsCollected());
    }
  }

  Future<void> _onTransactionAdd(
    TransactionAdd event,
    Emitter<TransactionsState> emit,
  ) async {
    emit(TransactionsLoading());

    bool addSuccess = await repository.addTransaction(
        type: prototypeTrans.type,
        ready: prototypeTrans.ready,
        date: prototypeTrans.date!,
        category: prototypeTrans.category!,
        value: prototypeTrans.value!,
        description: prototypeTrans.description!);

    prototypeTrans = TransactionModel(
        id: null,
        category: null,
        type: TransactionType.loss,
        ready: false,
        value: null,
        description: null,
        date: null);
    if (addSuccess) {
      emit(TransactionAddSuccess());
      add(FetchEvent());
    } else {
      print("Просто не получилось добавить");
      emit(TransactionAddFailed());
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
      print("Не получилось удалить");
      emit(TransactionDeleteFailed());
    }
  }

  Future<void> _onTransactionEdit(
    TransactionEdit event,
    Emitter<TransactionsState> emit,
  ) async {
    emit(TransactionsLoading());

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
        description: null,
        date: null);
    if (editSuccess) {
      emit(TransactionAddSuccess());
      add(FetchEvent());
    } else {
      print("Не получилось изменить");
      emit(TransactionEditFailed());
    }
  }
}
