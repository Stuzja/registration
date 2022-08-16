import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:registration/models/transaction_model.dart';
import 'package:registration/repositories/transactions_repository.dart';
import '../../../models/user_model.dart';
import '../../../resources/enums/transaction_category.dart';
import '../../../resources/enums/transaction_type.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  final ActionsWithTransactionsRepository repository;

  /*final _inputEventController = StreamController<TransactionsEvent>();
  StreamSink<TransactionsEvent> get inputEventSink =>
      _inputEventController.sink;

  final _outputStateController = StreamController<TransactionModel>();
  Stream<TransactionModel> get outputStateStream =>
      _outputStateController.stream;
  */
  TransactionsBloc({required this.repository}) : super(TransactionsInitial()) {
    on<TypeSubmitted>(_onTypeSubmitted);
    on<ReadinessSubmitted>(_onReadinessSubmitted);
    on<CategorySubmitted>(_onCategorySubmitted);
    on<DateSubmitted>(_onDateSubmitted);
    on<TransactionAdd>(_onTransactionAdd);
    on<ReadinessChanged>(_onReadinessChanged);
    on<TransactionDelete>(_onTransactionDelete);
    FirebaseFirestore.instance
        .collection('users')
        .doc(thisUser.username)
        .collection('transactions')
        .snapshots()
        .listen((event) {});
    //   _inputEventController.stream.listen(_onTransactionSubmitted);
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

  void _onTransactionAdd(
    TransactionAdd event,
    Emitter<TransactionsState> emit,
  ) async {
    emit(TransactionsLoading());

    if (prototypeTrans.category != null &&
        prototypeTrans.date != null &&
        event.money != null) {
      bool addSuccess = await repository.addTransaction(
          type: prototypeTrans.type,
          ready: prototypeTrans.ready,
          date: prototypeTrans.date!,
          category: prototypeTrans.category!,
          value: event.money!,
          description: event.description);

      if (addSuccess) {
        //    _outputStateController.sink.add(trans);
        emit(TransactionAddSuccess());
      } else {
        print("Просто не получилось добавить");
        emit(TransactionAddFailed());
      }
    } else {
      print("Не прошло проверку");
      emit(TransactionAddFailed());
    }
  }

  void _onTransactionDelete(
    TransactionDelete event,
    Emitter<TransactionsState> emit,
  ) async {
    emit(TransactionsLoading());

    bool deleteSuccess =
        await repository.deleteTransaction(transaction: event.transaction);
    if (deleteSuccess) {
      emit(TransactionDeleteSuccess());
    } else {
      print("Не получилось удалить");
      emit(TransactionDeleteFailed());
    }
  }
}
