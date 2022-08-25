import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:registration/models/create_transaction_model/money_model.dart';

part 'create_transaction_event.dart';
part 'create_transaction_state.dart';

class CreateTransactionBloc
    extends Bloc<CreateTransactionEvent, CreateTransactionState> {
  CreateTransactionBloc() : super(CreateTransactionInitial()) {
    on<CreateTransactionEvent>((event, emit) {
      on<MoneyChanged>(_onMoneyChanged);
      on<MoneyUnfocused>(_onMoneyUnfocused);
      on<FormSubmitted>(_onFormSubmitted);
    });
  }

  void _onMoneyChanged(
      MoneyChanged event, Emitter<CreateTransactionState> emit) {
    final money = Money.dirty(event.money.toString());
    emit(
      state.copyWith(
        money: money.valid ? money : Money.pure(event.money.toString()),
        status: Formz.validate([money]),
      ),
    );
  }

  void _onMoneyUnfocused(
      MoneyUnfocused event, Emitter<CreateTransactionState> emit) {
    final money = Money.dirty(state.money.value);
    emit(
      state.copyWith(
        money: money,
        status: Formz.validate([money]),
      ),
    );
  }

  Future<void> _onFormSubmitted(
    FormSubmitted event,
    Emitter<CreateTransactionState> emit,
  ) async {
    final money = Money.dirty(state.money.value);
    emit(
      state.copyWith(
        money: money,
        status: Formz.validate([money]),
      ),
    );
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    }
  }
}
