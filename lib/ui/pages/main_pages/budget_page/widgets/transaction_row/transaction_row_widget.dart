import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../blocs/transactions/bloc/transactions_bloc.dart';
import 'transaction_card.dart';

class TransactionRowWidget extends StatelessWidget {
  final bool ready;
  const TransactionRowWidget({Key? key, required this.ready}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 145.h,
        child: BlocBuilder<TransactionsBloc, TransactionsState>(
            builder: (context, state) {
          if (state is FetchLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is FetchState) {
            return ListView(
              padding: EdgeInsets.only(top: 24.h, bottom: 18.h),
              scrollDirection: Axis.horizontal,
              children: [
                if (ready)
                  for (var elem
                      in state.transactionsByMonth.where((tran) => tran.ready == true))
                    TransactionRowCard(transaction: elem)
                else
                  for (var elem in state.transactionsByMonth)
                    TransactionRowCard(transaction: elem)
              ],
            );
          }
          return const Text("Nothing here...");
        }));
  }
}
