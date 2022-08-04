import 'package:flutter/material.dart';
import 'package:registration/widgets/editing_transaction_layout/base_editing_widget.dart';

class EditTransactionPage extends StatelessWidget {
  const EditTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: BaseEditingTransactionWidget(
      title: "Edit a transaction",
    ),
    );
  }
}
