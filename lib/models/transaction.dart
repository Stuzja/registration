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
        'category': FormExtensionCategory(category).getName,
        'value': value,
        'date': date,
        'description': description,
      };



  @override
  String toString() {
    switch (category) {
      case TransactionCategory.salariesDev:
        return "Salaries dev.";
      case TransactionCategory.salariesMg:
        return "Salaries mg.";
      case TransactionCategory.internalHr:
        return "Internal HR";
      case TransactionCategory.externalHr:
        return "External HR";
      case TransactionCategory.credit:
        return "Credit";
      case TransactionCategory.dividends:
        return "Dividends";
      case TransactionCategory.bankCharges:
        return "Bank Charges";
      case TransactionCategory.taxes:
        return "Taxes";
      case TransactionCategory.awards:
        return "Awards";
      case TransactionCategory.others:
        return "Others";
      case TransactionCategory.profit:
        return "Profit";
    }
  }
}
