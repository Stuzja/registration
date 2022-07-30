part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class RegistrationSubmitted extends RegistrationEvent {
  final String email;
  final String password;
  const RegistrationSubmitted({required this.email, required this.password});
}
