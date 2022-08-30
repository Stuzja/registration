import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/abstract_auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AbstractAuthRepository repository;
  AuthBloc({
    required this.repository,
  }) : super(LoginInitialState()) {
    on<LoginSubmitted>(_onLoginSubmitted);
    on<LoginGoogleClick>(_onClickGoogleButton);
    on<LogoutPressed>(_onLogoutPressed);
    on<RegistrationSubmitted>(_onRegistrationSubmitted);
    on<EmailForResetSubmitted>(_onEmailForResetSubmitted);
  }

  void _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoginLoadingState());
    bool statusLogged =
        await repository.signIn(email: event.email, password: event.password);
    if (statusLogged) {
      emit(LoginSuccessState());
    } else {
      emit(LoginFailedState());
    }
  }

  void _onLogoutPressed(
    LogoutPressed event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoginLoadingState());
    bool statusUnlogged = await repository.signOut();
    if (statusUnlogged) {
      emit(LogoutSuccessState());
    } else {
      emit(LogoutFailedState());
    }
  }

  void _onClickGoogleButton(
    LoginGoogleClick event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoginLoadingState());
    bool isSuccess = await repository.signInGoogle();
    if (isSuccess) {
      emit(LoginSuccessState());
    } else {
      emit(LoginFailedState());
    }
  }

  void _onRegistrationSubmitted(
    RegistrationSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    emit(RegistrationLoadingState());
    bool success = await repository.signUp(
        email: event.email, password: event.password, username: event.username);
    if (success) {
      emit(RegistrationSuccessState());
    } else {
      emit(RegistrationFailedState());
    }
  }

  void _onEmailForResetSubmitted(
    EmailForResetSubmitted event,
    Emitter<AuthState> emit,
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
