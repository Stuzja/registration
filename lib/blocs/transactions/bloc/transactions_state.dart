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


class TransactionEditSuccess extends TransactionsState {}

class TransactionEditFailed extends TransactionsState {}


class TransactionDeleteSuccess extends TransactionsState {}

class TransactionDeleteFailed extends TransactionsState {}


class FieldSuccess extends TransactionsState {}

class FieldFailed extends TransactionsState {}

class ReadinessChangedSuccess extends TransactionsState {}


class FetchLoadingState extends TransactionsState {}

class FetchState extends TransactionsState {
  final List<TransactionModel> transactions;

  const FetchState(this.transactions);
}
