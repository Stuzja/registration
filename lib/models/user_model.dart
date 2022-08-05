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

  UserModel({
    this.username,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
  static UserModel fromJson(Map<String, dynamic> json) =>
      UserModel(email: json['email'], password: json['password']);
}

UserModel thisUser = UserModel(username: null, email: null, password: null);
