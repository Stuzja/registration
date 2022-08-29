import 'package:flutter/material.dart';

import '../ui/pages/auth_pages/login_page/login_page.dart';
import '../ui/pages/auth_pages/registration_page/registration_page.dart';
import '../ui/pages/auth_pages/reset_password_page.dart/create_password_page/create_password_page.dart';
import '../ui/pages/auth_pages/reset_password_page.dart/forgot_password_page.dart';
import '../ui/pages/auth_pages/reset_password_page.dart/verification_page.dart';
import '../ui/pages/main_pages/create_transaction_pages/add_transaction_page.dart';
import '../ui/pages/main_pages/home_page.dart';
import '../ui/pages/main_pages/splash_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/splash':
      return MaterialPageRoute(builder: (_) => const SplashPage());
    case '/login':
      return MaterialPageRoute(builder: (_) => const LoginPage());
    case '/register':
      return MaterialPageRoute(builder: (_) => const RegistrationPage());
    case '/forgotPassword':
      return MaterialPageRoute(builder: (_) => const ForgotPasswordPage());
    case '/verification':
      return MaterialPageRoute(builder: (_) => const VerificationPage());
    case '/createPassword':
      return MaterialPageRoute(builder: (_) => const CreatePasswordPage());
    case '/home':
      return MaterialPageRoute(builder: (_) => const HomePage());
    case '/add':
      return MaterialPageRoute(builder: (_) => const AddTransactionPage());
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}
