import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration/blocs/transactions/bloc/transactions_bloc.dart';
import 'package:registration/resources/enums/transaction_type.dart';

import 'switch_widget.dart';

class TypeField extends StatelessWidget {
  final TransactionType? type;
  const TypeField({Key? key, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwitchField(
      initialValue:
          (type != null) ? (type == TransactionType.profit ? 0 : 1) : 1,
      firstLabel: 'Profit',
      secondLabel: "Loss",
      switchTitle: 'Transaction type',
      onToggle: (ind) {
        TransactionType value;
        if (ind == 0) {
          value = TransactionType.profit;
        } else {
          value = TransactionType.loss;
        }
        context.read<TransactionsBloc>().add(FieldSubmitted(type: value));
      },
    );
  }
}
