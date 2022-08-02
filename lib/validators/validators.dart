class Validators {
  String? validateEmail(String? value) {
    String? _msg;
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (value == null) {
      _msg = "Enter your email";
    } else if (!regex.hasMatch(value)) {
      _msg = "Enter your email correctly";
    }
    return _msg;
  }

  String? validatePassword(String? value) {
    String? _msg;
    RegExp regex = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$');
    if (value == null) {
      _msg = "Enter your password";
    } else if (!regex.hasMatch(value)) {
      _msg =
          "The password must contain Latin characters in both registers \n and at least 1 digit and a special character";
    }
    return _msg;
  }

  String? validateUsername(String? value) {
    String? _msg;
    RegExp regex = RegExp(r'^[А-ЯЁ][а-яё]+$');
    if (value == null) {
      _msg = "Введите текст";
    } else {
      var match = regex.firstMatch(value);
      if (!regex.hasMatch(value)) {
        _msg = "Введите символами кириллицы с заглавной буквы";
      }
    }
    return _msg;
  }
}
