import 'package:registration/resources/enums/transaction_category.dart';
import '../resources/enums/transaction_type.dart';
import '../resources/formatters/formatters.dart';

class TransactionModel {
  String? id;
  TransactionType type;
  bool ready;
  DateTime? date;
  double? value;
  TransactionCategory? category;
  String? description;

  TransactionModel(
      {this.id,
      required this.type,
      required this.ready,
      required this.date,
      required this.category,
      required this.value,
      required this.description});

  TransactionModel.fromJson(Map<String, dynamic> json)
      : type = Formatters().fromStringToType(json['type']),
        category = Formatters().fromStringToCategory(json['category']),
        id = json['id'],
        ready = json['ready'],
        value = json['value'],
        description = json['description'],
        date = json['date'].toDate();

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': FormExtensionType(type).getString,
        'ready': ready,
        'category': FormExtensionCategory(category!).getString,
        'value': value,
        'date': date,
        'description': description,
      };

  TransactionModel copyWith(
    TransactionType? type,
    bool? ready,
    DateTime? date,
    double? value,
    TransactionCategory? category,
    String? description,
  ) {
    return TransactionModel(
      type: type ?? this.type,
      ready: ready ?? this.ready,
      date: date ?? this.date,
      value: value ?? this.value,
      category: category ?? this.category,
      description: description ?? this.description,
    );
  }

  bool get fieldsCollected {
    final listOfTrans = [type, ready, date, value, category];
    for (var elem in listOfTrans) {
      if (elem == null) {
        return false;
      }
    }
    return true;
  }
}

TransactionModel prototypeTrans = TransactionModel(
    id: null,
    category: null,
    type: TransactionType.loss,
    ready: false,
    value: null,
    description: null,
    date: null);
