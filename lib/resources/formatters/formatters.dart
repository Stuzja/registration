import 'package:registration/models/transaction_model.dart';
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
}
