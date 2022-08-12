
import 'package:intl/intl.dart';

class MonthYear {
  late final int month;
  late final int year;

  MonthYear({required int month, required int year}) {
    this.year = year + month ~/ 12;
    this.month = month % 12;
  }

  MonthYear operator +(int x) {
    return MonthYear(month: month + x, year: year);
  }

  @override
  String toString() {
    return "${DateFormat('MMMM').format(DateTime(0, month))} $year";
  }

  MonthYear.fromDateTime(DateTime dateTime) {
    month = dateTime.month;
    year = dateTime.year;
  }
}
