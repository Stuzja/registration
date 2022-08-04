import 'package:registration/models/transaction.dart';

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
  others,
  profit,
}

extension FormExtensionCategory on TransactionCategory {
  String get getName {
    switch (this) {
      case TransactionCategory.salariesDev:
        return "salaryDev";
      case TransactionCategory.salariesMg:
        return "salaryMg";
      case TransactionCategory.internalHr:
        return "internalHr";
      case TransactionCategory.externalHr:
        return "externalHr";
      case TransactionCategory.credit:
        return "credit";
      case TransactionCategory.dividends:
        return "dividends";
      case TransactionCategory.bankCharges:
        return "bankCharges";
      case TransactionCategory.taxes:
        return "taxes";
      case TransactionCategory.awards:
        return "awards";
      case TransactionCategory.others:
        return "other";
      case TransactionCategory.profit:
        return "profit";
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

List<Transaction> listTransactionReady =
    listTransaction.where((element) => element.ready == true).toList();
