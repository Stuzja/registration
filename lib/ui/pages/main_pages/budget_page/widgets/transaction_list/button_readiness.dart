import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/resources/constants/path_images.dart';
import 'package:registration/resources/enums/transaction_category.dart';

import '../../../../../../blocs/transactions/bloc/transactions_bloc.dart';
import '../../../../../../models/transaction_model.dart';

class ButtonElemReadiness extends StatelessWidget {
  final TransactionModel transaction;
  const ButtonElemReadiness({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      width: 48.w,
      decoration: BoxDecoration(
        color: transaction.category!.getColorTitle,
        shape: BoxShape.circle,
      ),
      child: InkWell(
        onTap: () {
          context
              .read<TransactionsBloc>()
              .add(ReadinessChanged(transaction: transaction));
        },
        child: transaction.ready
            ? SizedBox(
                height: 24.h,
                width: 24.w,
                child: Image.asset(checkMark),
              )
            : Container(),
      ),
    );
  }
}
