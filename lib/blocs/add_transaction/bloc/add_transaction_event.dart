part of 'add_transaction_bloc.dart';

abstract class AddTransactionEvent extends Equatable {
  const AddTransactionEvent();

  @override
  List<Object> get props => [];
}

class TypeSubmitted extends AddTransactionEvent {
  final TransactionType newValue;

  const TypeSubmitted({required this.newValue});
}

class ReadinessSubmitted extends AddTransactionEvent {
  final bool newValue;

  const ReadinessSubmitted({required this.newValue});
}

class CategorySubmitted extends AddTransactionEvent {
  final TransactionCategory newValue;

  const CategorySubmitted({required this.newValue});
}

class DateSubmitted extends AddTransactionEvent {
  final DateTime newValue;

  const DateSubmitted({required this.newValue});
}

class TransactionAdd extends AddTransactionEvent {
  final double money;
  final String? description;
  const TransactionAdd(
      {required this.money, this.description});
}
