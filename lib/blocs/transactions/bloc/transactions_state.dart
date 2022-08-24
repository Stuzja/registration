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

 class TransactionCreate extends TransactionsState {
  final TransactionType type;
  final bool ready;
  final DateTime? date;
  final bool isValueValid;
  final double? value;
  final TransactionCategory? category;
  final String? description;
  bool get isFormValid => isValueValid;

  const TransactionCreate(
      {this.isValueValid = false,
      this.type = TransactionType.loss,
      this.ready = false,
      this.date,
      this.value,
      this.category,
      this.description});

  TransactionCreate copyWith({
    bool? isValueValid,
    TransactionType? type,
    bool? ready,
    DateTime? date,
    double? value,
    TransactionCategory? category,
    String? description,
  }) {
    return TransactionCreate(
      isValueValid: isValueValid ?? this.isValueValid,
      type: type ?? this.type,
      ready: ready ?? this.ready,
      date: date ?? this.date,
      value: value ?? this.value,
      category: category ?? this.category,
      description: description ?? this.description,
    );
  }
}
