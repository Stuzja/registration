import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/resources/constants/colors.dart';
import 'package:registration/widgets/budget_layout/transaction_list/transaction_list.dart';
import 'package:registration/widgets/budget_layout/transaction_row_card/transaction_row.dart';
import 'package:registration/widgets/top_widget.dart';

import '../../blocs/transactions/bloc/transactions_bloc.dart';
import '../../repositories/transactions_repository.dart';

class BaseBudgetWidget extends StatelessWidget {
  final String title;
  final bool ready;
  const BaseBudgetWidget({Key? key, required this.title, required this.ready})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopWidget(title: title),
        TransactionRowWidget(ready: ready),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: Column(children: [
            const Divider(color: ColorClass.greyDark),
            BlocProvider(
              create: (context) {
                return TransactionsBloc(
                    repository: ActionsWithTransactionsRepository());
              },
              child: TransactionListWidget(ready: ready),
            ),
          ]),
        ),
      ],
    );
  }
}
