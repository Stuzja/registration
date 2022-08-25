import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:registration/blocs/create_transaction/bloc/create_transaction_bloc.dart';

class CreateTransactionPage extends StatefulWidget {
  const CreateTransactionPage({super.key});

  @override
  State<CreateTransactionPage> createState() => _CreateTransactionPageState();
}

class _CreateTransactionPageState extends State<CreateTransactionPage> {
  final _moneyFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _moneyFocusNode.addListener(() {
      if (!_moneyFocusNode.hasFocus) {
        context.read<CreateTransactionBloc>().add(MoneyUnfocused());
        //  FocusScope.of(context).requestFocus(_passwordFocusNode);
      }
    });
  }

  @override
  void dispose() {
    _moneyFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateTransactionBloc, CreateTransactionState>(
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          showDialog<void>(
            context: context,
            builder: (_) => const SuccessDialog(),
          );
        }
        if (state.status.isSubmissionInProgress) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Submitting...')),
            );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            EmailInput(focusNode: _moneyFocusNode),
            const SubmitButton(),
          ],
        ),
      ),
    );
  }
}

class EmailInput extends StatelessWidget {
  const EmailInput({super.key, required this.focusNode});

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateTransactionBloc, CreateTransactionState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.money.value,
          focusNode: focusNode,
          decoration: InputDecoration(
            icon: const Icon(Icons.email),
            labelText: 'Money',
            helperText: 'A complete, valid email e.g. joe@gmail.com',
            errorText: state.money.invalid
                ? 'Please ensure the email entered is valid'
                : null,
          ),
          keyboardType: TextInputType.emailAddress,
          onSaved: (value) {
            if (value!=null)
            context
                .read<CreateTransactionBloc>()
                .add(MoneyChanged(money: double.parse(value)));
          },
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateTransactionBloc, CreateTransactionState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state.status.isValidated
              ? () => context.read<CreateTransactionBloc>().add(FormSubmitted())
              : null,
          child: const Text('Submit'),
        );
      },
    );
  }
}

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: const <Widget>[
                Icon(Icons.info),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Form Submitted Successfully!',
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
