import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration/blocs/transactions/bloc/transactions_bloc.dart';
import 'package:registration/repositories/transactions_repository.dart';

import 'widgets/fields_transaction_widget.dart';

class AddTransactionPage extends StatelessWidget {
  const AddTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return TransactionsBloc(repository: TransactionRepository());
      },
      child: const Scaffold(
          body: FieldsForTransactionWidget(
        title: "Add",
      )),
    );
  }
}
