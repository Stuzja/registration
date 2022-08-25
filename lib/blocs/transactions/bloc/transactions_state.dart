part of 'transactions_bloc.dart';

abstract class TransactionsState extends Equatable {
  const TransactionsState();

  @override
  List<Object> get props => [];
}

class TransactionsInitial extends TransactionsState {}

class TransactionsLoading extends TransactionsState {}

class TransactionAddSuccess extends TransactionsState {}

class TransactionAddFailed extends TransactionsState {}

class TransactionEditFailed extends TransactionsState {}

class TransactionDeleteFailed extends TransactionsState {}

class FieldSuccess extends TransactionsState {}

class ReadinessChangedSuccess extends TransactionsState {}

class FetchLoadingState extends TransactionsState {}

class FetchState extends TransactionsState {
  final List<TransactionModel> transactionsByMonth;
  final List<TransactionModel> transactionsByYear;

  const FetchState(
      {required this.transactionsByMonth, required this.transactionsByYear});
}

class FieldsCollected extends TransactionsState{}