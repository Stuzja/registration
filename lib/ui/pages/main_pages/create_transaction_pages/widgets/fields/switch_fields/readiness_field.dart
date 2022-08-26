import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration/blocs/transactions/bloc/transactions_bloc.dart';

import 'switch_widget.dart';

class ReadinessField extends StatelessWidget {
  final bool? readiness;
  const ReadinessField({Key? key, this.readiness}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwitchField(
      initialValue: (readiness != null) ? (readiness! ? 0 : 1) : 1,
      firstLabel: 'OK',
      secondLabel: "Wait",
      switchTitle: 'Status',
      onToggle: (ind) {
        bool value;
        if (ind == 0) {
          value = true;
        } else {
          value = false;
        }
        context.read<TransactionsBloc>().add(FieldSubmitted(ready: value));
      },
    );
  }
}
