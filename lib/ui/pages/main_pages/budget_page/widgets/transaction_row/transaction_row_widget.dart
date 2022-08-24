import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/resources/enums/transaction_category.dart';
import '../../../../../../models/transaction_model.dart';
import '../../../../../../resources/theme/custom_theme.dart';


import 'backround_of_card.dart';

class TransactionRowCard extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionRowCard({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorTitle = transaction.category!.getColorTitle;
    final colorLight = transaction.category!.getColorLight;
    final colorMain = transaction.category!.getColorMain;
    return Container(
      margin: EdgeInsets.only(right: 9.h),
      child: Stack(
        children: [
          BackgroundOfTransactionCard(
            colorLight: colorLight,
            colorMain: colorMain,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.category!.getString,
                  style: CustomTheme.lightTheme.textTheme.bodyText2
                      ?.copyWith(color: colorTitle),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.h),
                  child: Text(
                    "₽${transaction.value.toString()}",
                    style: CustomTheme.lightTheme.textTheme.headline2
                        ?.copyWith(color: colorTitle),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
