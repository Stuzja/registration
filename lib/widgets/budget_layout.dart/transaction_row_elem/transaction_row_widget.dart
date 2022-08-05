import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/resources/enums/transaction_category.dart';
import '../../../models/transaction.dart';
import '../../../resources/theme/custom_theme.dart';

class TransactionRowElem extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionRowElem({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorTitle = transaction.category.getColorTitle;
    final colorLight = transaction.category.getColorLight;
    final colorMain = transaction.category.getColorMain;
    return Container(
      margin: EdgeInsets.only(right: 9.h),
      padding: EdgeInsets.only(left: 16.w),
      width: 153.w,
      decoration:  BoxDecoration(
        gradient: LinearGradient(colors: [colorLight, colorMain]),
        borderRadius: const BorderRadius.all(Radius.circular(25)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            transaction.toString(),
            style: CustomTheme.lightTheme.textTheme.bodyText2
                ?.copyWith(color: colorTitle),
          ),
          Text("₽${transaction.value.toString()}",
              style: CustomTheme.lightTheme.textTheme.headline2
                  ?.copyWith(color: colorTitle))
        ],
      ),
    );
  }
}
