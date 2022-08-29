import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:registration/blocs/transactions/bloc/transactions_bloc.dart';
import 'package:registration/models/transaction_model.dart';
import 'package:registration/ui/common_widgets/buttons/main_button.dart';

class ButtonAddWidget extends StatefulWidget {
  final String title;
  final TransactionModel? transaction;

  const ButtonAddWidget({Key? key, required this.title, this.transaction})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => ButtonAddWidgetState();
}

class ButtonAddWidgetState extends State<ButtonAddWidget> {
  bool isDisable = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<TransactionsBloc, TransactionsState>(
      listener: (context, state) {
        if (state is TransactionAddFailedState) {
          final snackBar = SnackBar(
            content: const Text('Failed to add transaction'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {},
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (state is TransactionEditFailedState) {
          final snackBar = SnackBar(
            content: const Text('Failed to edit transaction'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {},
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (state is TransactionLoadingState) {
          Navigator.pushNamed(context, '/splash');
        }
        if (state is TransactionAddSuccessState) {
          Navigator.pushNamed(context, '/home');
        }
        if (state is FieldsCollectedState) {
          setState(() {
            isDisable = false;
          });
        }
      },
      child: MainButton(
          isLight: false,
          name: widget.title,
          onPressed: isDisable
              ? null
              : () {
                  if (widget.transaction == null) {
                    context.read<TransactionsBloc>().add(TransactionAdd());
                  } else {
                    context.read<TransactionsBloc>().add(TransactionEdit());
                  }
                }),
    );
  }
}
