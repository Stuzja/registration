import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: purple,
            ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          toolbarHeight: 34,
          color: purple,
          elevation: 0,
        ),
        textTheme: TextTheme(
          labelMedium: TextStyle(
              color: black.withOpacity(0.5),
              fontWeight: FontWeight.w400,
              fontSize: 14,
              fontFamily: "Nunito"),
          bodyText1: const TextStyle(
              color: greyDark,
              fontWeight: FontWeight.w400,
              fontSize: 14,
              fontFamily: "Nunito"),
          button: const TextStyle(
              color: purple,
              fontWeight: FontWeight.w600,
              fontSize: 14,
              fontFamily: "Nunito"),
        ));
  }
}
