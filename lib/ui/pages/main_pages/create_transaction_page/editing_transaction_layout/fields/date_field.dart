import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:registration/blocs/transactions/bloc/transactions_bloc.dart';
import 'package:registration/resources/constants/colors.dart';


import 'transaction_field.dart';

class DateTextField extends StatefulWidget {
  final DateTime? initialDateTime;
  const DateTextField({Key? key, required this.initialDateTime})
      : super(key: key);

  @override
  State<DateTextField> createState() => _DateTextFieldState();
}

class _DateTextFieldState extends State<DateTextField> {
  TextEditingController dateInput = TextEditingController();
  @override
  void initState() {
    dateInput.text = widget.initialDateTime != null
        ? DateFormat('dd/MM/yyyy').format(widget.initialDateTime!)
        : "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TransactionField(
      controller: dateInput,
      labelText: "Date",
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = widget.initialDateTime;
        pickedDate = await showDatePicker(
            builder: ((context, child) {
              return Theme(
                data: ThemeData.dark().copyWith(
                    colorScheme: const ColorScheme.dark(
                      primary: ColorClass.purple,
                      onPrimary: Color.fromARGB(85, 27, 27, 27),
                      surface: Color.fromARGB(255, 97, 69, 113),
                      onSurface: Color.fromARGB(255, 224, 177, 251),
                    ),
                    dialogBackgroundColor: ColorClass.purple,
                    textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(primary: Colors.white),
                    )),
                child: child!,
              );
            }),
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101));

        if (pickedDate != null) {
          String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);

          // ignore: use_build_context_synchronously
          context
              .read<TransactionsBloc>()
              .add(DateSubmitted(newValue: pickedDate));

          setState(() {
            dateInput.text = formattedDate;
          });
        }
      },
    );
  }
}
