import 'package:emlak/components/loading_popup.dart';
import 'package:emlak/models/user_model.dart';
import 'package:emlak/service/service.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LoginRiverpod extends ChangeNotifier {
  BuildContext? context;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final box = GetStorage();
  final token = GetStorage().read("token");

  Future<bool?> fetchLogin() async {
    debugPrint(
        "fetchLogin  çalıştı. Tel: ${username.text} Pass: ${password.text}");
    showLoadingAppLogoDialog(context!);
    return await Service.loginCall(
            username: username.text, password: password.text)
        .then((UserModel? userModel) {
      if (userModel?.username != "" ) {
        return true;
      } else {
        return false;
      }
    });
  }
}
