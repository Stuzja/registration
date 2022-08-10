import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: ColorClass.purple,
            ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          toolbarHeight: 0,
          color: ColorClass.purple,
          elevation: 0,
        ),
        textTheme: TextTheme(
          labelMedium: TextStyle(
              color: ColorClass.black.withOpacity(0.5),
              fontWeight: FontWeight.w400,
              fontSize: 14,
              fontFamily: "Nunito"),
          headline1: const TextStyle(
            color: ColorClass.black,
            fontWeight: FontWeight.w700,
            fontSize: 20,
            fontFamily: "Nunito",
          ),
          headline2: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            fontFamily: "Montserrat",
          ),
          headline3: const TextStyle(
              color: ColorClass.purple,
              fontWeight: FontWeight.w500,
              fontSize: 14,
              fontFamily: "Inter"),
          bodyText1: const TextStyle(
              color: ColorClass.greyDark,
              fontWeight: FontWeight.w400,
              fontSize: 14,
              fontFamily: "Nunito"),
          bodyText2: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18,
            fontFamily: "Montserrat",
          ),
          button: const TextStyle(
              color: ColorClass.purple,
              fontWeight: FontWeight.w600,
              fontSize: 14,
              fontFamily: "Nunito"),
        ));
  }
}
