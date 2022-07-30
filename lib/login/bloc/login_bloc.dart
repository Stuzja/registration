import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration/models/user_model.dart';

import 'package:registration/repositories/login_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository repository;
  LoginBloc({
    required this.repository,
  }) : super(LoginWaitingState()){
    on<LoginSubmitted>(_onSubmitted);
  }

  void _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoadingState());
    UserModel user =
        await repository.signIn(email: event.email, password: event.password);
    if (user.status == StateUserLogged.isLogged) {
      emit(LoginSuccessState());
    } else {
      emit(LoginFailedState());
    }
  }
}
