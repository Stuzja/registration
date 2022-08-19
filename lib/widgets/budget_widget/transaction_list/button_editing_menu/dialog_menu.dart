import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../blocs/transactions/bloc/transactions_bloc.dart';
import '../../../../models/transaction_model.dart';
import '../../../../pages/main_pages/edit_transaction_page.dart';
import '../../../../resources/theme/custom_theme.dart';

class MenuEditingDialog {
  final BuildContext contextA;
  final TransactionModel transaction;
  MenuEditingDialog({required this.contextA, required this.transaction});
  void showSimpleDialog() {
    showDialog(
        context: contextA,
        builder: (contextB) {
          return SimpleDialog(
            title: Text('Choose an Option',
                style: CustomTheme.lightTheme.textTheme.headline1),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  prototypeTrans = transaction;
                  Navigator.push(
                    contextA,
                    MaterialPageRoute(
                      builder: (_) =>
                          EditTransactionPage(transaction: transaction),
                    ),
                  );
                },
                child: const Text('Edit'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  contextA
                      .read<TransactionsBloc>()
                      .add(TransactionDelete(transaction: transaction));
                  Navigator.pop(contextB);
                },
                child: const Text('Delete'),
              ),
            ],
          );
        });
  }
}
