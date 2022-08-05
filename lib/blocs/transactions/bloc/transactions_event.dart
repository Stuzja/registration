part of 'transactions_bloc.dart';

abstract class TransactionsEvent extends Equatable {
  const TransactionsEvent();

  @override
  List<Object> get props => [];
}

class NewTransactionSubmitted extends TransactionsEvent {
  final TransactionType type;
  final bool ready;
  final DateTime date;
  final double value;
  final TransactionCategory category;
  final String description;
  const NewTransactionSubmitted(
      {required this.type,
      required this.ready,
      required this.date,
      required this.value,
      required this.category,
      required this.description});
}
