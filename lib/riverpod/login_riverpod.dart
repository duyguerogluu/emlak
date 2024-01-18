// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:emlak/components/loading_popup.dart';
import 'package:emlak/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LoginRiverpod extends ChangeNotifier {
  BuildContext? context;
  TextEditingController telNo = TextEditingController();
  TextEditingController passwprd = TextEditingController();
  final box = GetStorage();
  final token = GetStorage().read("token");

  Future<bool?> fetchLogin() async {
    log("fetchLogin  çalıştı. Tel: ${telNo.text} Pass: ${passwprd.text}");
    loadingPopup();
  }
}
