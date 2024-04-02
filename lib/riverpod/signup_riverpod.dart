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
import 'package:emlak/service/service.dart';
import 'package:flutter/material.dart';

class SignupRiverpod extends ChangeNotifier {
  BuildContext? context;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();

  Future<bool?> fetchSignup(context) async {
    debugPrint("fetchSignup çalıştı");
    showLoadingAppLogoDialog(context);

    var result = await Service.signupCall(
      username: username.text,
      password: password.text,
      firstName: firstName.text,
      lastName: lastName.text,
      phone: phone.text,
      email: email.text,
    );
  }
}
