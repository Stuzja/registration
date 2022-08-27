part of 'auth_bloc.dart';

abstract class AuthState {}

class LoginInitialState extends AuthState {}

class LoginSuccessState extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginFailedState extends AuthState {}

class LogoutSuccessState extends AuthState {}

class LogoutFailedState extends AuthState {}

class RegistrationSuccessState extends AuthState {}

class RegistrationLoadingState extends AuthState {}

class RegistrationFailedState extends AuthState {}

class ResetPasswordLoadingState extends AuthState {}

class EmailSuccessState extends AuthState {}

class EmailFailedState extends AuthState {}

 