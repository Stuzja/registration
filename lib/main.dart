import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:user_repository/user_repository.dart';
import 'app.dart';



void main() {

 runApp( App(
    authenticationRepository: AuthenticationRepository(),
    userRepository: UserRepository(),
  ));
}