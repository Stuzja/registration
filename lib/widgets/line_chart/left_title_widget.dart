import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../resources/theme/custom_theme.dart';

Widget leftTitleWidgets(double value, TitleMeta meta) {
  String text;
  switch (value.toInt()) {
    case 0:
      text = '0';
      break;
    case 2:
      text = '10K';
      break;
    case 4:
      text = '20k';
      break;
    case 6:
      text = '50k';
      break;
    default:
      return Container();
  }

  return Text(text,
      style: CustomTheme.lightTheme.textTheme.headline3,
      textAlign: TextAlign.left);
}
