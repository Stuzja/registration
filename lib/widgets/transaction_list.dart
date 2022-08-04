import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:registration/models/transaction.dart';
import 'package:registration/resources/constants/path_images.dart';
import '../resources/theme/custom_theme.dart';
import 'package:intl/date_symbol_data_local.dart';

class TransactionListElem extends StatelessWidget {
  final Transaction transaction;
  const TransactionListElem({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = transaction.getColor();
    return Container(
      margin: EdgeInsets.only(top: 11.h),
      child: Row(children: [
        Container(
          height: 48.h,
          width: 48.w,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: InkWell(
            onTap: () {},
            child: transaction.ready
                ? SizedBox(
                    height: 24.h,
                    width: 24.w,
                    child: Image.asset(checkMark),
                  )
                : Container(),
          ),
        ),
        SizedBox(width: 8.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              transaction.toString(),
              style: CustomTheme.lightTheme.textTheme.bodyText2
                  ?.copyWith(color: color),
            ),
            Text(DateFormat('d MMMM y').format(transaction.date),
                style: CustomTheme.lightTheme.textTheme.bodyText2
                    ?.copyWith(fontSize: 12))
          ],
        ),
        const Spacer(),
        Text(transaction.value.toString()),
        SizedBox(width: 29.w),
        Text(
          ">",
          style: CustomTheme.lightTheme.textTheme.bodyText2
              ?.copyWith(color: color),
        )
      ]),
    );
  }
}
