import 'package:flutter/material.dart';
import 'package:registration/resources/enums/transaction_category.dart';
import '../resources/constants/colors.dart';
import '../resources/enums/transaction_type.dart';

class TransactionModel {
  TransactionType type;
  bool ready;
  DateTime date;
  double value;
  TransactionCategory category;
  String? description;

  TransactionModel(
      {required this.type,
      required this.ready,
      required this.date,
      required this.category,
      required this.value,
      this.description});

  Map<String, dynamic> toJson() => {
        'type': FormExtensionType(type).getName,
        'ready': ready,
        'category': FormExtensionCategory(category).getString,
        'value': value,
        'date': date,
        'description': description,
      };
}
