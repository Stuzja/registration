enum TransactionType { profit, loss }

extension FormExtensionType on TransactionType {
  String get getString {
    switch (this) {
      case TransactionType.profit:
        return "profit";
      case TransactionType.loss:
        return "loss";
    }
  }
}
