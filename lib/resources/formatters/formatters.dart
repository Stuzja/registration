import 'package:registration/models/transaction.dart';

import '../../models/transaction_category.dart';

class Formatters {
  String toMoneyFormat(String value) {
    String newValue = value.split('').reversed.join('');
    return newValue;
  }

  String toCharacterEarnFormat(Transaction transaction) {
    String value = "₽${transaction.value}";
    if (transaction.type == TransactionType.profit) {
      value = "+$value";
    } else {
      value = "-$value";
    }
    return value;
  }
}
