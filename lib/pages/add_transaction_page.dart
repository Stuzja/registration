import 'package:flutter/material.dart';
import 'package:registration/widgets/editing_transaction_layout/base_editing_widget.dart';

import '../widgets/appbar.dart';

class AddTransactionPage extends StatelessWidget {
  const AddTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body:  EditingTransactionWidget(
          title: "Add",
        ));
  }
}
