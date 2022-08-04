import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../models/transaction.dart';
import '../../resources/theme/custom_theme.dart';


class TransactionRowElem extends StatelessWidget {
  final Transaction transaction;
  const TransactionRowElem({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = transaction.getColor();
    return Container(
      margin: EdgeInsets.only(right: 9.h),
      padding: EdgeInsets.only(left: 16.w),
      width: 153.w,
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            transaction.toString(),
            style: CustomTheme.lightTheme.textTheme.bodyText2
                ?.copyWith(color: color),
          ),
          Text("₽${transaction.value.toString()}",
              style: CustomTheme.lightTheme.textTheme.headline2
                  ?.copyWith(color: color))
        ],
      ),
    );
  }
}
