import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:registration/repositories/abstract_auth_repository.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final AbstractAuthRepository repository;
  RegistrationBloc({
    required this.repository,
  }) : super(RegistrationInitialState()) {
    on<RegistrationSubmitted>(_onSubmitted);
  }

  void _onSubmitted(
    RegistrationSubmitted event,
    Emitter<RegistrationState> emit,
  ) async {
    emit(RegistrationLoadingState());
    bool success = await repository.signUp(
        email: event.email, password: event.password, userName: event.username);
    if (success) {
      emit(RegistrationSuccessState());
    } else {
      emit(RegistrationFailedState());
    }
  }
}
