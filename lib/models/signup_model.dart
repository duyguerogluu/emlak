import 'dart:convert';

SignupModel signupModelFromJson(String str) =>
    SignupModel.fromMap(jsonDecode(str));

String signupModelToJson(SignupModel data) => jsonEncode(data.toMap);

class SignupModel {
  final String username;
  final String password;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;

  SignupModel({
    required this.username,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
  });

  factory SignupModel.fromMap(Map<String, dynamic> json) => SignupModel(
        username: json["username"],
        password: json["password"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        email: json["email"],
      );

  Map<String, dynamic> get toMap => {
        "username": username,
        "password": password,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "email": email,
      };
}
