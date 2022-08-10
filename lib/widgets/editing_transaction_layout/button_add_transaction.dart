import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../blocs/transactions/bloc/transactions_bloc.dart';
import '../buttons/main_button.dart';

class ButtonAddTransactionWidget extends StatefulWidget {
  final TextEditingController moneyController;
  final TextEditingController descriptionController;
  const ButtonAddTransactionWidget({
    Key? key,
    required this.moneyController,
    required this.descriptionController,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => ButtonAddTransactionWidgetState();
}

class ButtonAddTransactionWidgetState
    extends State<ButtonAddTransactionWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<TransactionsBloc, TransactionsState>(
      listener: (context, state) {
        if (state is TransactionsFailed) {
          final snackBar = SnackBar(
            content: const Text(
                'Failed to add transaction'),
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
        if (state is TransactionsSuccess) {
          Navigator.pushNamed(context, '/home');
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 22.h),
        child: MainButtonDark(
            name: 'Add',
            onPressed: () {
              context.read<TransactionsBloc>().add(TransactionAdd(
                    money: double.parse(widget.moneyController.text),
                    description: widget.descriptionController.text,
                  ));
            }),
      ),
    );
  }
}
