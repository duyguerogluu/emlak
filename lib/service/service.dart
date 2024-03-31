import 'dart:convert';
import 'package:bcrypt/bcrypt.dart';
import 'package:emlak/models/advert_model.dart';
import 'package:emlak/models/signup_model.dart';
import 'package:emlak/models/user_model.dart';
import 'package:emlak/url/url.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Service {
  // Don't create a new class, use services directly
  Service._();

  static const _jwtSalt = r'$2b$10$.KBl4AFFZIuq2GQusY68NO';

  static String get token {
    // TODO: Save token to DB!!!
    return "";
  }

  static bool _isAuthRequired = false;

  static Future<List<AdvertModel>?> advertCall() async {
    var response = await http.get(Uri.parse(baseUrl + "/adverts"));

    debugPrint("Response Status Code advertCall: ${response.statusCode}");
    debugPrint("Response Body: ${response.body}");

    if (response.statusCode == 200) {
      List adverts = jsonDecode(response.body);
      return adverts
          .map<AdvertModel>(
            (element) => AdvertModel.fromMap(element),
          )
          .toList();
    } else {
      throw ('Failed to get data with status code: ${response.statusCode}');
    }
  }

  static Future<AdvertModel?> advertAdd(AdvertModel advert) async {
    var response = await http.post(
      Uri.parse(baseUrl + "/adverts"),
      body: advert.toString(),
      headers: {
        if (_isAuthRequired) 'Cookie': 'jwt=$token',
      },
    );
    if (response.statusCode == 200) {
      debugPrint("Response Body: ${response.body}");
      debugPrint("Response Status Code advertAdd: ${response.statusCode}");
      debugPrint("İlan Kaydedildi.");

      return AdvertModel.fromMap(jsonDecode(response.body));
    } else {
      debugPrint("Response Status Code signupCall: ${response.statusCode}");
      return null;
    }
  }

  static Future<Map<String, dynamic>?> imagesCall({
    required List<String> photoIds,
  }) async {
    final response = await http.post(
      Uri.parse(baseUrl + "/adverts/images"),
      headers: {
        if (_isAuthRequired) 'Cookie': 'jwt=$token',
      },
      body: {'images': photoIds},
    );
    debugPrint(response.toString());

    if (response.statusCode == 200) {
      debugPrint("Response Body: ${response.body}");
      return jsonDecode(response.body);
    } else {
      throw ('Failed to get data with status code: ${response.statusCode}');
    }
  }

  static Future<UserModel?> loginCall({
    required String username,
    required String password,
  }) async {
    Map<String, String> jsonData = {
      "username": username,
      "password": BCrypt.hashpw(password, _jwtSalt),
    };

    final response = await http.post(
      Uri.parse(baseUrl + "/login"),
      body: jsonEncode(jsonData),
    );
    debugPrint(response.toString());

    if (response.statusCode == 200) {
      debugPrint("Response Body: ${response.body}");
      var result = UserModel.fromMap(jsonDecode(response.body));

      return result;
    } else {
      throw ('Failed to get data with status code: ${response.statusCode}');
    }
  }

  static Future<SignupModel?> signupCall({SignupModel? signupModel}) async {
    var user = 'your_proxy_username';
    var pass = 'your_proxy_password';

    var basicAuth = 'Basic ' + base64Encode(utf8.encode('$user:$pass'));

    final jsonData = signupModel?.toMap;

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
