import 'package:flutter/material.dart';
import 'package:registration/resources/constants/colors.dart';

enum TransactionType { profit, loss }

enum TransactionCategory {
  salariesDev,
  salariesMg,
  internalHr,
  externalHr,
  credit,
  dividends,
  bankCharges,
  taxes,
  awards,
  others
}

extension Methods on TransactionCategory {
  String parseToString() {
    switch (this) {
      case TransactionCategory.salariesDev:
        return "Salaries Dev.";
      case TransactionCategory.salariesMg:
        return "Salaries Mg.";
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
    }
  }
}
