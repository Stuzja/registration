class UserJsonModel {
  String id;
  final String userName;
  final String login;
  final String password;
  UserJsonModel(
      {this.id = '', this.userName = '', this.login = '', this.password = ''});
  Map<String, dynamic> toJson() => {
        'email': login,
        'password': password,
      };
  static UserJsonModel fromJson(Map<String, dynamic> json) =>
      UserJsonModel(login: json['email'], password: json['password']);
}
