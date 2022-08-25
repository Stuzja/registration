import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../repositories/abstract_auth_repository.dart';
part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final AbstractAuthRepository repository;
  ResetPasswordBloc({
    required this.repository,
  }) : super(ResetPasswordInitialState()) {
    on<EmailForResetSubmitted>(_onEmailForResetSubmitted);
  }

  void _onEmailForResetSubmitted(
    EmailForResetSubmitted event,
    Emitter<ResetPasswordState> emit,
  ) async {
    emit(ResetPasswordLoadingState());
    bool emailSent = await repository.resetPassword(email: event.email);
    if (emailSent) {
      emit(EmailSuccessState());
    } else {
      emit(EmailFailedState());
    }
  }
}
