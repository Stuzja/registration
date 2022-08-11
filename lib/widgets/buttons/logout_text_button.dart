import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/login/bloc/login_bloc.dart';
import '../../resources/theme/custom_theme.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LogoutSuccessState) {
          Navigator.pushNamed(context, '/login');
        }
        if (state is LogoutFailedState) {
          final snackBar = SnackBar(
            content: const Text("Couldn't log out of your account"),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {},
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: TextButton(
        child: Text(
          "Logout",
          style: CustomTheme.lightTheme.textTheme.headline3
              ?.copyWith(color: Colors.red, fontSize: 16),
        ),
        onPressed: () {
          context.read<LoginBloc>().add(LogoutPressed());
        },
      ),
    );
  }
}
