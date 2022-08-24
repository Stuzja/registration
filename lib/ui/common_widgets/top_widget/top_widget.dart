import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/blocs/transactions/bloc/transactions_bloc.dart';
import 'package:registration/repositories/transactions_repository.dart';
import 'package:registration/resources/formatters/formatters.dart';

import '../../../resources/theme/custom_theme.dart';
import 'page_view_months.dart';
import 'page_view_year.dart';


class TopWidget extends StatelessWidget {
  final bool monthly;
  final String? title;
  final bool ready;
  const TopWidget(
      {Key? key, this.title, required this.ready, required this.monthly})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124.h,
      width: 363.w,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(60.0),
            bottomLeft: Radius.circular(60.0)),
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(138, 93, 165, 1),
            Color.fromRGBO(25, 152, 207, 1),
          ],
          begin: Alignment.center,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          monthly ? const PageViewMonths() : const PageViewYear(),
          BlocBuilder<TransactionsBloc, TransactionsState>(
            builder: (context, state) {
              if (state is FetchState) {
                var sum = ActionsWithTransactionsRepository().getResultMoney(
                    listTrans: monthly
                        ? state.transactionsByMonth
                        : state.transactionsByYear,
                    ready: ready);
                return SizedBox(
                  height: 78.h,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(Formatters().getTitleFromMoney(title, sum),
                            style: CustomTheme.lightTheme.textTheme.headline1),
                        Text("₽$sum",
                            style: CustomTheme.lightTheme.textTheme.headline1
                                ?.copyWith(color: Colors.white, fontSize: 32)),
                      ]),
                );
              } else {
                return SizedBox(height: 78.h);
              }
            },
          ),
        ],
      ),
    );
  }
}
