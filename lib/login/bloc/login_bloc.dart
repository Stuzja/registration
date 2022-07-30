import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:formz/formz.dart';
import 'package:registration/repositories/login_repository.dart';
import '../models/models.dart';

part 'login_event.dart';
part 'login_state.dart';

/*class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository repository;
  LoginBloc({
    required this.repository,
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const LoginState()) {
    on<LoginSubmitted>(_onSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoadingState());
    await repository.signIn(email: event.email, password: event.password);
    if ()
    {
      emit(LoginSuccessState());
    }
    else {
      emit(LoginFailedState());
    }
  }
}
*/