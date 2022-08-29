import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration/blocs/auth/bloc/auth_bloc.dart';
import 'package:registration/ui/common_widgets/buttons/google_button.dart';

class LoginGoogleWidget extends StatelessWidget {
  const LoginGoogleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            Navigator.pushNamed(context, '/home');
          }
        },
        child: GoogleButton(
          onPressed: () =>
              context.read<AuthBloc>().add(const LoginGoogleClick()),
        ));
  }
}
