import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration/blocs/create_transaction/bloc/create_transaction_bloc.dart';
import 'package:registration/blocs/transactions/bloc/transactions_bloc.dart';
import 'package:registration/repositories/transactions_repository.dart';
import 'package:registration/ui/pages/main_pages/new_create_transaction_page/create_transaction_page.dart';

import 'editing_transaction_layout/base_editing_widget.dart';

class AddTransactionPage extends StatelessWidget {
  const AddTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return TransactionsBloc(repository: TransactionRepository());
      },
      child: const Scaffold(
          body: EditingTransactionWidget(
      title: "Add",
      )),
    );
    
    /*BlocProvider(
      create: (context) {
        return CreateTransactionBloc();
      },
      child: const Scaffold(
          body: CreateTransactionPage(
      
      )),
    );*/
  }
}
