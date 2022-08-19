import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/blocs/transactions/bloc/transactions_bloc.dart';
import 'transaction_list_elem.dart';

class TransactionListWidget extends StatelessWidget {
  final bool ready;

  const TransactionListWidget({super.key, required this.ready});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 393.h,
        child: BlocBuilder<TransactionsBloc, TransactionsState>(
            builder: (context, state) {
          if (state is FetchLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is FetchState) {
            return ListView(
              children: [
                if (ready)
                  for (var elem
                      in state.transactions.where((tran) => tran.ready == true))
                    TransactionListElem(transaction: elem)
                else
                  for (var elem in state.transactions)
                    TransactionListElem(transaction: elem)
              ],
            );
          }
          return const Text("Nothing here...");
        }));
  }
}
