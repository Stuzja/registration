import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        if (state is TransactionEditFailed) {
          final snackBar = SnackBar(
            content: const Text('Failed to edit transaction'),
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
          Navigator.pushNamed(context, '/home');
        }
        if (state is FieldsCollected) {
          setState(() {
            isDisable = false;
          });
        }
      },
      child: MainButtonDark(
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
