import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/transaction_category.dart';
import '../../../repositories/transactions_repository.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  final ActionsWithTransactionsRepository repository;
  TransactionsBloc(this.repository) : super(TransactionsInitialState()) {
    on<NewTransactionSubmitted>(_onSubmitted);
  }

  void _onSubmitted(
    NewTransactionSubmitted event,
    Emitter<TransactionsState> emit,
  ) async {
    emit(TransactionsLoadingState());
    bool addSuccess = await repository.addTransaction(
        id: 1,
        userName: userName,
        type: event.type,
        ready: event.ready,
        date: event.date,
        category: event.category,
        value: event.value);
    if (addSuccess) {
      emit(TransactionsSuccessState());
    } else {
      emit(TransactionsFailedState());
    }
  }
}