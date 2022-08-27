part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginSubmitted extends AuthEvent {
  final String email;
  final String password;
  const LoginSubmitted({required this.email, required this.password});
}

class LoginGoogleClick extends AuthEvent {
  const LoginGoogleClick();
}

class LogoutPressed extends AuthEvent {}

class RegistrationSubmitted extends AuthEvent {
  final String username;
  final String email;
  final String password;
  const RegistrationSubmitted(
      {required this.username, required this.email, required this.password});
}

class EmailForResetSubmitted extends AuthEvent {
  final String email;
  const EmailForResetSubmitted({required this.email});
}
