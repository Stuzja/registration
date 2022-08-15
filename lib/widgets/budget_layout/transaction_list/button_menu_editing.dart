import 'package:flutter/material.dart';
import 'package:registration/resources/enums/transaction_category.dart';

import '../../../models/transaction_model.dart';

class DropDownButtonEditing extends StatefulWidget {
  const DropDownButtonEditing({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DropDownButtonEditingState();
}

class DropDownButtonEditingState extends State<DropDownButtonEditing> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: menuItems,
      value: selectedValue,
      onChanged: (newValue) {
        setState(() {
          selectedValue = newValue.toString();
        });
      },
    );
  }
}

List<DropdownMenuItem<String>> menuItems = const [
  DropdownMenuItem(value: "Edit", child: Text("Edit")),
  DropdownMenuItem(value: "Delete", child: Text("Delete")),
];

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(value: "Edit", child: Text("Edit")),
    DropdownMenuItem(value: "Delete", child: Text("Delete")),
  ];
  return menuItems;
}

class DropDownMenuEditing extends StatelessWidget {
  final TransactionModel transaction;
  const DropDownMenuEditing({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        dropdownItems;
      },
      icon: Icon(
        Icons.keyboard_arrow_right_outlined,
        color: transaction.category!.getColorTitle,
      ),
    );
  }
}
