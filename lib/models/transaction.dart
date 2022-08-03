import 'package:flutter/material.dart';
import 'package:registration/models/transaction_category.dart';

import '../resources/constants/colors.dart';

class Transaction {
  TransactionType type;
  bool ready;
  DateTime date;
  double value;
  TransactionCategory category;
  String? description;

  Transaction(
      {required this.type,
      required this.ready,
      required this.date,
      required this.category,
      required this.value,
      this.description});


  Color toColor() {
    switch (category) {
      case TransactionCategory.salariesDev:
        return salaryDev;
      case TransactionCategory.salariesMg:
        return salaryMg;
      case TransactionCategory.internalHr:
        return internalHr;
      case TransactionCategory.externalHr:
        return externalHr;
      case TransactionCategory.credit:
        return credit;
      case TransactionCategory.dividends:
        return dividends;
      case TransactionCategory.bankCharges:
        return bankCharges;
      case TransactionCategory.taxes:
        return taxes;
      case TransactionCategory.awards:
        return awards;
      case TransactionCategory.others:
        return other;
    }
  }
}

List<Transaction> listTransaction = [
  Transaction(
      type: TransactionType.profit,
      ready: false,
      date: DateTime.now(),
      category: TransactionCategory.awards,
      value: 1100.000),
  Transaction(
      type: TransactionType.loss,
      ready: true,
      date: DateTime.now(),
      category: TransactionCategory.credit,
      value: 200.000),
  Transaction(
      type: TransactionType.loss,
      ready: false,
      date: DateTime.now(),
      category: TransactionCategory.salariesDev,
      value: 1100.000),
];
