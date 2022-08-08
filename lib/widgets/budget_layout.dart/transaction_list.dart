import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:registration/models/transaction_model.dart';
import 'package:registration/resources/enums/transaction_category.dart';
import 'package:registration/resources/constants/path_images.dart';
import '../../resources/enums/transaction_type.dart';
import '../../resources/formatters/formatters.dart';
import '../../resources/theme/custom_theme.dart';

class TransactionListElem extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionListElem({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorTitle = transaction.category.getColorTitle;
    return Container(
      margin: EdgeInsets.only(top: 11.h),
      child: Row(children: [
        Container(
          height: 48.h,
          width: 48.w,
          decoration: BoxDecoration(
            color: colorTitle,
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
              transaction.category.getName,
              style: CustomTheme.lightTheme.textTheme.bodyText2
                  ?.copyWith(color: colorTitle),
            ),
            Text(DateFormat('d MMMM y').format(transaction.date),
                style: CustomTheme.lightTheme.textTheme.bodyText2
                    ?.copyWith(fontSize: 12))
          ],
        ),
        const Spacer(),
        Text(Formatters().toCharacterEarnFormat(transaction),
            style: CustomTheme.lightTheme.textTheme.bodyText2?.copyWith(
                fontSize: 16,
                color: transaction.type == TransactionType.profit
                    ? Colors.green
                    : Colors.red)),
        SizedBox(width: 29.w),
        Text(
          ">",
          style: CustomTheme.lightTheme.textTheme.bodyText2
              ?.copyWith(color: colorTitle),
        )
      ]),
    );
  }
}
