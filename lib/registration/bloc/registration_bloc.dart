import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/user_model.dart';
import '../../repositories/login_repository.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final LoginRepository repository;
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
    UserModel user =
        await repository.signUp(email: event.email, password: event.password);
    if (user.statusRegistered == StateUserRegistered.isRegistered) {
      emit(RegistrationSuccessState());
    } else {
      emit(RegistrationFailedState());
    }
  }
}
