import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/resources/constants/colors.dart';
import 'package:registration/widgets/budget_widget/transaction_list/transaction_list.dart';
import 'package:registration/widgets/top_widget/top_widget.dart';
import '../../blocs/transactions/bloc/transactions_bloc.dart';
import '../../repositories/transactions_repository.dart';
import 'transaction_row/transaction_row.dart';

class BaseBudgetWidget extends StatelessWidget {
  final String? title;
  final bool ready;
  const BaseBudgetWidget({Key? key, this.title, required this.ready})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TransactionsBloc(repository: ActionsWithTransactionsRepository())
            ..add(FetchEvent()), 
    /*   create: (context) {
        return TransactionsBloc(
            repository: ActionsWithTransactionsRepository()
            );
      },*/
      child: Column(
        children: [
          TopWidget(title: title, ready: ready),
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
    );
  }
}
