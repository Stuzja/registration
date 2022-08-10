import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'circle_painter.dart';

class BackgroundOfTransactionCard extends StatelessWidget {
  final Color colorLight;
  final Color colorMain;
  const BackgroundOfTransactionCard(
      {super.key, required this.colorLight, required this.colorMain,});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [colorLight, colorMain]),
        ),
        height: 103.h,
        width: 153.w,
        child: CustomPaint(
          painter: CirclePainter(colorLight),
        ),
      ),
    );
  }
}
