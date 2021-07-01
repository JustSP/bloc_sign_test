import 'dart:convert';

class SignInModel {
  final String username;
  final String password;
  final String token;
  final String error;

  SignInModel(
      {this.username = "",
      this.password = "",
      this.token = "",
      this.error = ""});

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
