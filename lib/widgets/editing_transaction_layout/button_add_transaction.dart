import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../blocs/transactions/bloc/transactions_bloc.dart';
import '../../resources/enums/transaction_category.dart';
import '../../resources/enums/transaction_type.dart';
import '../buttons/main_button.dart';

class ButtonAddTransactionWidget extends StatefulWidget {
  final TransactionType type;
  final bool ready;
  final TextEditingController moneyController;
  final TextEditingController descriptionController;

  const ButtonAddTransactionWidget(
      {Key? key,
      required this.moneyController,
      required this.descriptionController,
      required this.ready,
      required this.type})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => ButtonAddTransactionWidgetState();
}

class ButtonAddTransactionWidgetState
    extends State<ButtonAddTransactionWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<TransactionsBloc, TransactionsState>(
      listener: (context, state) {
        if (state is TransactionsFailedState) {}
        if (state is TransactionsSuccessState) {
          Navigator.pushNamed(context, '/splash');
        }
        if (state is TransactionsSuccessState) {
          Navigator.pushNamed(context, '/home');
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 22.h),
        child: MainButtonDark(
            name: 'Add',
            onPressed: () {
              context.read<TransactionsBloc>().add(NewTransactionSubmitted(
                  type: widget.type,
                  category: TransactionCategory.awards,
                  date: DateTime.now(),
                  value: double.parse(widget.moneyController.text.trim()),
                  ready: widget.ready,
                  description: widget.descriptionController.text.trim()));
            }),
      ),
    );
  }
}
