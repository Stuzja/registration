import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          bodyText1: const TextStyle(
              color: ColorClass.greyDark,
              fontWeight: FontWeight.w400,
              fontSize: 14,
              fontFamily: "Nunito"),
          button: const TextStyle(
              color: ColorClass.purple,
              fontWeight: FontWeight.w600,
              fontSize: 14,
              fontFamily: "Nunito"),
        ));
  }
}
