import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration/blocs/transactions/bloc/transactions_bloc.dart';
import 'package:registration/models/transaction_model.dart';
import 'package:registration/repositories/transactions_repository.dart';

import 'editing_transaction_layout/base_editing_widget.dart';

class EditTransactionPage extends StatelessWidget {
  final TransactionModel transaction;
  const EditTransactionPage({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return TransactionsBloc(repository: TransactionRepository());
      },
      child: Scaffold(
        body: EditingTransactionWidget(
          title: "Edit",
          transaction: transaction,
        ),
      ),
    );
  }
}
