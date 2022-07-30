enum StateUserLogged {
  isLogged,
  unLogged,
}

class UserModel {
  String? username;
  String? email;
  String? password;
  StateUserLogged status = StateUserLogged.unLogged;

  UserModel({
    required this.email,
    required this.password,
  });
}
