part of 'transactions_bloc.dart';

abstract class TransactionsEvent extends Equatable {
  const TransactionsEvent();

  @override
  List<Object> get props => [];
}

class TypeSubmitted extends TransactionsEvent {
  final TransactionType newValue;

  const TypeSubmitted({required this.newValue});
}

class ReadinessSubmitted extends TransactionsEvent {
  final bool newValue;

  const ReadinessSubmitted({required this.newValue});
}

class ReadinessChanged extends TransactionsEvent {
  final TransactionModel transaction;

  const ReadinessChanged({required this.transaction});
}

class CategorySubmitted extends TransactionsEvent {
  final TransactionCategory newValue;

  const CategorySubmitted({required this.newValue});
}

class DateSubmitted extends TransactionsEvent {
  final DateTime newValue;

  const DateSubmitted({required this.newValue});
}

class TransactionAdd extends TransactionsEvent {
  final double? money;
  final String? description;
  const TransactionAdd({required this.money, required this.description});
}

class CalculateSum extends TransactionsEvent { 
}

