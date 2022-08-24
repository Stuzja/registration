import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration/blocs/transactions/bloc/transactions_bloc.dart';
import 'package:registration/ui/pages/main_pages/editing_transaction_layout/fields/switch_fields/switch_widget.dart';

class SwitchFieldsWidget extends StatelessWidget {
  const SwitchFieldsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<TransactionsBloc, TransactionsState>(
      listener: (context, state) {
        if (state is TypeSubmitted) {}
        if (state is ReadinessSubmitted) {}
      },
      child: Column(children: [
      /*  SwitchField(
            firstLabel: "OK",
            secondLabel: "Wait",
            switchTitle: "Status",
            onTap: () {
              context
                  .read<TransactionsBloc>()
                  .add(ReadinessSubmitted(newValue: value));
            }),
        SwitchField(
            firstLabel: "Profit",
            secondLabel: "Loss",
            switchTitle: "Transaction type"),*/
      ]),
    );
  }
}
