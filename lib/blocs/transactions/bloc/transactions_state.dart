part of 'transactions_bloc.dart';

abstract class TransactionsState extends Equatable {
  const TransactionsState();

  @override
  List<Object> get props => [];
}

class TransactionsInitialState extends TransactionsState {}

class TransactionLoadingState extends TransactionsState {}

class TransactionAddSuccessState extends TransactionsState {}

class TransactionAddFailedState extends TransactionsState {}

class TransactionEditFailedState extends TransactionsState {}

class TransactionDeleteFailedState extends TransactionsState {}

class ReadinessChangedState extends TransactionsState {}

class FetchLoadingState extends TransactionsState {}

class FetchFailedState extends TransactionsState {}

class FetchState extends TransactionsState {
  final List<TransactionModel> transactionsByMonth;
  final List<TransactionModel> transactionsByYear;

  const FetchState(
      {required this.transactionsByMonth, required this.transactionsByYear});
}

class FieldsCollectedState extends TransactionsState {}
