import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../blocs/transactions/bloc/transactions_bloc.dart';
import 'switch_widget.dart';

class ReadinessField extends StatefulWidget {
  const ReadinessField({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ReadinessFieldState();
}

class ReadinessFieldState extends State<ReadinessField> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<TransactionsBloc, TransactionsState>(
      listener: (context, state) {
        if (state is FieldSuccess) {}
      },
      child: SwitchField(
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
          context
              .read<TransactionsBloc>()
              .add(ReadinessSubmitted(newValue: value));
        },
      ),
    );
  }
}
