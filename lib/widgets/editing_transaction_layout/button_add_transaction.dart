import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../blocs/transactions/bloc/transactions_bloc.dart';
import '../../models/transaction_model.dart';
import '../buttons/main_button.dart';

class ButtonAddTransactionWidget extends StatelessWidget {
  final String title;
  final TransactionModel? transaction;
  final TextEditingController moneyController;
  final TextEditingController descriptionController;

  const ButtonAddTransactionWidget(
      {Key? key,
      required this.title,
      required this.moneyController,
      required this.descriptionController,
      this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<TransactionsBloc, TransactionsState>(
      listener: (context, state) {
        if (state is TransactionAddFailed) {
          final snackBar = SnackBar(
            content: const Text('Failed to add transaction'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {},
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (state is TransactionsLoading) {
          Navigator.pushNamed(context, '/splash');
        }
        if (state is TransactionAddSuccess) {
          Navigator.pop(context);
          Navigator.pop(context);
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 22.h),
        child: MainButtonDark(
            name: title,
            onPressed: () {
              if (transaction == null) {
                context.read<TransactionsBloc>().add(TransactionAdd(
                      money: double.parse(moneyController.text),
                      description: descriptionController.text,
                    ));
              } else {
                context.read<TransactionsBloc>().add(TransactionEdit(
                      money: double.parse(moneyController.text),
                      description: descriptionController.text,
                    ));
              }
            }),
      ),
    );
  }
}
