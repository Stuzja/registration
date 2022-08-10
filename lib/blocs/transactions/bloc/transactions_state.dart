part of 'transactions_bloc.dart';

abstract class TransactionsState extends Equatable {
  const TransactionsState();
  
  @override
  List<Object> get props => [];
}

class TransactionsInitial extends TransactionsState {}

class TransactionsLoading extends TransactionsState {}

class TransactionsSuccess extends TransactionsState {}

class TransactionsFailed extends TransactionsState {}

class FieldSuccess extends TransactionsState {}

class FieldFailed extends TransactionsState {}