part of 'create_transaction_bloc.dart';

abstract class CreateTransactionEvent extends Equatable {
  const CreateTransactionEvent();

  @override
  List<Object> get props => [];
}

class MoneyChanged extends CreateTransactionEvent {
  final double money;

  const MoneyChanged({required this.money});
}

class MoneyUnfocused extends CreateTransactionEvent {}

class FormSubmitted extends CreateTransactionEvent {}
