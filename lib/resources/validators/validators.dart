class Validators {
  String? validateEmail(String? value) {
    String? msg;
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (value == null) {
      msg = "Enter your email";
    } else if (!regex.hasMatch(value)) {
      msg = "Enter your email correctly";
    }
    return msg;
  }

  String? validatePassword(String? value) {
    String? msg;
    RegExp regex = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$');
    if (value == null) {
      msg = "Enter your password";
    } else if (!regex.hasMatch(value)) {
      msg =
          "The password must contain Latin characters in both registers \n and at least 1 digit and a special character";
    }
    return msg;
  }

  String? validateUsername(String? value) {
    String? msg;
    if (value == null) {
      msg = "Enter your username";
    }
    return msg;
  }

  
}
