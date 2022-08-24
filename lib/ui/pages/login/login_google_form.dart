import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/login/bloc/login_bloc.dart';
import '../../common_widgets/buttons/google_button.dart';


class LoginGoogleWidget extends StatelessWidget {
  const LoginGoogleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFailedState) {}
          if (state is LoginSuccessState) {
            Navigator.pushNamed(context, '/home');
          }
        },
        child: GoogleButton(
          onPressed: () => context.read<LoginBloc>().add(const LoginGoogleClick()),
        ));
  }
}
