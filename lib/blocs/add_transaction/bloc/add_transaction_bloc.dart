import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:registration/models/transaction_model.dart';
import 'package:registration/repositories/transactions_repository.dart';
import '../../../resources/enums/transaction_category.dart';
import '../../../resources/enums/transaction_type.dart';

part 'add_transaction_event.dart';
part 'add_transaction_state.dart';

class AddTransactionBloc
    extends Bloc<AddTransactionEvent, AddTransactionState> {
  final ActionsWithTransactionsRepository repository;
/*
  final _inputEventController = StreamController<AddTransactionEvent>();
  StreamSink<AddTransactionEvent> get inputEventSink =>
      _inputEventController.sink;

  final _outputStateController = StreamController<TransactionModel>();
  Stream<TransactionModel> get outputStateStream =>
      _outputStateController.stream;
*/
  AddTransactionBloc({required this.repository})
      : super(AddTransactionInitial()) {
    on<TypeSubmitted>(_onTypeSubmitted);
    on<ReadinessSubmitted>(_onReadinessSubmitted);
    on<CategorySubmitted>(_onCategorySubmitted);
    on<DateSubmitted>(_onDateSubmitted);
    on<TransactionAdd>(_onTransactionSubmitted);
 //   _inputEventController.stream.listen(_onTransactionSubmitted);
  }

  void _onTypeSubmitted(
    TypeSubmitted event,
    Emitter<AddTransactionState> emit,
  ) {
    prototypeTrans.type = event.newValue;
  }

  void _onReadinessSubmitted(
    ReadinessSubmitted event,
    Emitter<AddTransactionState> emit,
  ) {
    prototypeTrans.ready = event.newValue;
  }

  void _onCategorySubmitted(
    CategorySubmitted event,
    Emitter<AddTransactionState> emit,
  ) async {
    prototypeTrans.category = event.newValue;
  }

  void _onDateSubmitted(
    DateSubmitted event,
    Emitter<AddTransactionState> emit,
  ) {
    prototypeTrans.date = event.newValue;
  }

  void _onTransactionSubmitted(
    TransactionAdd event,
    Emitter<AddTransactionState> emit,
  ) async {
    emit(AddTransactionLoading());

    if (prototypeTrans.category != null &&
        prototypeTrans.date != null &&
        event.money != null) {
      var trans = TransactionModel(
          type: prototypeTrans.type,
          ready: prototypeTrans.ready,
          date: prototypeTrans.date!,
          category: prototypeTrans.category!,
          value: event.money!,
          description: event.description);

      bool addSuccess =
          await repository.addWholeTransaction(transaction: trans);

      if (addSuccess) {
    //    _outputStateController.sink.add(trans);
        emit(AddTransactionSuccess());
      } else {
        print("Просто не получилось добавить");
        emit(AddTransactionFailed());
      }
    } else {
      print("Не прошло проверку");
      emit(AddTransactionFailed());
    }
  }
}
