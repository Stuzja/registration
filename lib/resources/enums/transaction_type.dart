import 'package:registration/resources/enums/transaction_category.dart';
import '../../models/transaction.dart';

enum TransactionType { profit, loss }

extension FormExtensionType on TransactionType {
  String get getName {
    switch (this) {
      case TransactionType.profit:
        return "profit";
      case TransactionType.loss:
        return "loss";
    }
  }
}

List<TransactionModel> listTransaction = [
  TransactionModel(
      type: TransactionType.profit,
      ready: false,
      date: DateTime.now(),
      category: TransactionCategory.awards,
      value: 1100.000),
  TransactionModel(
      type: TransactionType.loss,
      ready: true,
      date: DateTime.now(),
      category: TransactionCategory.credit,
      value: 200.000),
  TransactionModel(
      type: TransactionType.loss,
      ready: false,
      date: DateTime.now(),
      category: TransactionCategory.salariesDev,
      value: 1100.000),
];

List<TransactionModel> listTransactionReady =
    listTransaction.where((element) => element.ready == true).toList();
