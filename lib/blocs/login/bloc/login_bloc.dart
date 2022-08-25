import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration/repositories/login_google_repository.dart';

import '../../../repositories/abstract_auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AbstractAuthRepository repository;
  final LoginGoogleRepository loginGoogle;
  LoginBloc({
    required this.loginGoogle,
    required this.repository,
  }) : super(LoginInitialState()) {
    on<LoginSubmitted>(_onSubmitted);
    on<LoginGoogleClick>(_onClickGoogleButton);
    on<LogoutPressed>(_onLogoutPressed);
  }

  void _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
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
    Emitter<LoginState> emit,
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
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoadingState());
    bool isSuccess = await loginGoogle.signIn();
    if (isSuccess) {
      emit(LoginSuccessState());
    } else {
      emit(LoginFailedState());
    }
  }
}
