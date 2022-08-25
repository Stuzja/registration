part of 'create_transaction_bloc.dart';

class CreateTransactionState extends Equatable {
  final Money money;
  final FormzStatus status;

  const CreateTransactionState({
    this.money = const Money.pure(),
    this.status = FormzStatus.pure,
  });

  CreateTransactionState copyWith({
    Money? money,
    FormzStatus? status,
  }) {
    return CreateTransactionState(
      money: money ?? this.money,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [money];
}

class CreateTransactionInitial extends CreateTransactionState {}
