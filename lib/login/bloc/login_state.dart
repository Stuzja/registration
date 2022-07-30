part of 'login_bloc.dart';

abstract class LoginState {}

class LoginWaitingState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginFailedState extends LoginState {}
