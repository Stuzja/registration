enum StateUserLogged {
  isLogged,
  unLogged,
}

enum StateUserRegistered{
  isRegistered,
  unRegistered,
}

class UserModel {
  String? username;
  String? email;
  String? password;
  StateUserLogged statusLogged = StateUserLogged.unLogged;
  StateUserRegistered statusRegistered = StateUserRegistered.unRegistered;
  bool emailSent = false;

  UserModel({
    required this.email,
    required this.password,
  });
}
