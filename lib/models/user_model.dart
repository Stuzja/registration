class UserModel {
  String username;
  String email;
  String password;

  UserModel({
    required this.username,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'userName': username,
        'email': email,
        'password': password,
      };
  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
      username: json['username'],
      email: json['email'],
      password: json['password']);
}

UserModel thisUser = UserModel(username: "", email: "", password: "");
