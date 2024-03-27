import 'dart:convert';
import 'package:emlak/models/login_model.dart';
import 'package:emlak/models/signup_model.dart';
import 'package:emlak/url/url.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Service {
  // Don't create a new class, use services directly
  Service._();

  //Login
  static Future<LoginModel?> loginCall(
      {required String telNo, required String password}) async {
    Map<String, String> jsonData = {
      "Telefon": telNo,
      "Sifre": password,
    };

    final response = await http.post(
      Uri.parse("$baseUrl/KullaniciGiris"),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(jsonData),
    );
    print(response.toString());

    if (response.statusCode == 200) {
      debugPrint("Response Body: ${response.body}");
      var result = LoginModel.fromJson(jsonDecode(response.body));

      return result;
    }

    return LoginModel(
        isError: true, errorMsg: "Giriş yapılamadı! Error: ${response.body}");
  }
    static Future<SignupModel?> signupCall({
    required String adi,
    required String soyadi,
    required String email,
    required String telefon,
    required String sifre,
  }) async {
    var user = 'your_proxy_username';
    var pass = 'your_proxy_password';
    var basicAuth = 'Basic ' + base64Encode(utf8.encode('$user:$pass'));

    Map<String, dynamic> jsonData = {
      "adi": adi,
      "soyadi": soyadi,
      "telefon": telefon,
      "email": email,
      "sifre": sifre,
    };

    debugPrint("AUTH: $basicAuth");

    var response = await http.post(
      Uri.parse(baseUrl + "/KullaniciKaydetGuncelle"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': basicAuth,
      },
      body: jsonEncode(jsonData),
    );
    if (response.statusCode == 200) {
      debugPrint("Response Body: ${response.body}");
      debugPrint("Response Status Code signupCall: ${response.statusCode}");
      debugPrint("Kayıt okey");
      final signupModel = signupModelFromJson(response.body);
      return signupModel; //jsonDecode(response.body);
    } else {
      debugPrint("Response Status Code signupCall: ${response.statusCode}");
      return null;
    }
  }


}
