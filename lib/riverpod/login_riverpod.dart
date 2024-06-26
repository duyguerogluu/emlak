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
