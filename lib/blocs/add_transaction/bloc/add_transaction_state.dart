part of 'add_transaction_bloc.dart';

abstract class AddTransactionState extends Equatable {
  const AddTransactionState();
  
  @override
  List<Object> get props => [];
}

class AddTransactionInitial extends AddTransactionState {}

class AddTransactionLoading extends AddTransactionState {}

class AddTransactionSuccess extends AddTransactionState {}

class AddTransactionFailed extends AddTransactionState {}

class FieldSuccess extends AddTransactionState {}

class FieldFailed extends AddTransactionState {}