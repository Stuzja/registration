import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/resources/constants/colors.dart';

import '../../../../blocs/transactions/bloc/transactions_bloc.dart';
import '../../../../repositories/transactions_repository.dart';
import '../../../common_widgets/top_widget/top_widget.dart';
import 'widgets/transaction_list/transaction_list.dart';
import 'widgets/transaction_row/transaction_row.dart';

class BaseBudgetPage extends StatelessWidget {
  final String? title;
  final bool ready;
  const BaseBudgetPage({Key? key, this.title, required this.ready})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: BlocProvider(
          create: (context) =>
              TransactionsBloc(repository: ActionsWithTransactionsRepository())
                ..add(FetchEvent()),
          child: SizedBox(
            child: Column(
              children: [
                TopWidget(title: title, ready: ready, monthly: true),
                TransactionRowWidget(ready: ready),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17.w),
                  child: Column(children: [
                    const Divider(color: ColorClass.greyDark),
                    TransactionListWidget(ready: ready),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
