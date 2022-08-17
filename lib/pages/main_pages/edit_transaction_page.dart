import 'package:flutter/material.dart';
import 'package:registration/widgets/editing_transaction_layout/base_editing_widget.dart';
import '../../models/transaction_model.dart';

class EditTransactionPage extends StatelessWidget {
  final TransactionModel transaction;
  const EditTransactionPage({Key? key, required this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditingTransactionWidget(
        title: "Edit",
        transaction: transaction,
      ),
    );
  }
}
