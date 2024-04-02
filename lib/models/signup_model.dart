/*
 *  This file is part of emlak.
 *
 *  emlak is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  emlak is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *   along with emlak.  If not, see <https://www.gnu.org/licenses/>.
 */

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
