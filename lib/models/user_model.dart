enum StateUserLogged {
  isLogged,
  unLogged,
}

enum StateUserRegistered {
  isRegistered,
  unRegistered,
}

class UserModel {
  String? username;
  String? email;
  String? password;
  StateUserLogged statusLogged = StateUserLogged.unLogged;
  bool emailSent = false;
  bool googleSignIn = false;

  UserModel({
    this.username,
    required this.email,
    required this.password,
  });
}

UserModel? thisUser;
