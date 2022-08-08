import 'package:registration/models/transaction_model.dart';
import 'package:registration/resources/enums/transaction_category.dart';
import '../enums/transaction_type.dart';

class Formatters {
  String toMoneyFormat(String value) {
    String newValue = value.split('').reversed.join('');
    return newValue;
  }

  String toCharacterEarnFormat(TransactionModel transaction) {
    String value = "₽${transaction.value}";
    if (transaction.type == TransactionType.profit) {
      value = "+$value";
    } else {
      value = "-$value";
    }
    return value;
  }

  TransactionCategory fromNameToCategory(String? value) {
    switch (value) {
      case "Salaries dev.":
        return TransactionCategory.salariesDev;
      case "Salaries mg.":
        return TransactionCategory.salariesMg;
      case "Internal HR":
        return TransactionCategory.internalHr;
      case "External HR":
        return TransactionCategory.externalHr;
      case "Credit":
        return TransactionCategory.credit;
      case "Dividends":
        return TransactionCategory.dividends;
      case "Bank Charges":
        return TransactionCategory.bankCharges;
      case "Taxes":
        return TransactionCategory.taxes;
      case "Awards":
        return TransactionCategory.awards;
      case "Others":
        return TransactionCategory.others;
      case "Profit":
        return TransactionCategory.profit;
      default:
        return TransactionCategory.others;
    }
  }
}
