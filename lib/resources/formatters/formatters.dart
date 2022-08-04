class Formatters {
  String toMoneyFormat(String value) {
    String newValue = value.split('').reversed.join('');
    return newValue;
  }
}
