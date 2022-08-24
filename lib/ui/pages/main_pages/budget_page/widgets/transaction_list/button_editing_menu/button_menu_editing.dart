import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration/blocs/transactions/bloc/transactions_bloc.dart';
import 'package:registration/models/transaction_model.dart';
import 'package:registration/resources/enums/transaction_category.dart';

import 'dialog_menu.dart';

class ButtonEditingMenu extends StatelessWidget {
  final TransactionModel transaction;
  const ButtonEditingMenu({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<TransactionsBloc, TransactionsState>(
      listener: (context, state) {
        if (state is TransactionDeleteFailed) {
          Navigator.pop(context);
          final snackBar = SnackBar(
            content: const Text('Failed to delete transaction'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {},
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: IconButton(
        onPressed: () {
          MenuEditingDialog(transaction: transaction, contextA: context)
              .showSimpleDialog();
        },
        icon: Icon(
          Icons.keyboard_arrow_right_outlined,
          color: transaction.category!.getColorTitle,
        ),
      ),
    );
  }
}
