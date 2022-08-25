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

class TransactionAdd extends TransactionsEvent {}

class TransactionEdit extends TransactionsEvent {}

class TransactionDelete extends TransactionsEvent {
  final TransactionModel transaction;
  const TransactionDelete({required this.transaction});
}

class FetchEvent extends TransactionsEvent {}

class DateChanged extends TransactionsEvent {
  final MonthYear? newMonth;
  final int? newYear;

  const DateChanged({this.newMonth, this.newYear});
}

class FieldSubmitted extends TransactionsEvent {
  final TransactionType? type;
  final bool? ready;
  final DateTime? date;
  final double? value;
  final TransactionCategory? category;
  final String? description;
  final TransactionModel? transaction;

  const FieldSubmitted(
      {this.type,
      this.ready,
      this.date,
      this.value,
      this.category,
      this.description,
      this.transaction});
}
