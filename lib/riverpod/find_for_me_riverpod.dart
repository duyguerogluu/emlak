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

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:url_launcher/url_launcher.dart';

class FindForMeRiverpod extends ChangeNotifier {
  String? dropdownValue = "konut";
  String? dropdownValue2 = "daire";
  BuildContext? context;
  List<String> rooms = const [
    "1+0",
    "1+1",
    "2+1",
    "2+2",
    "3+1",
    "3+2",
    "4+1",
    "4+2",
    "5+1",
    "6+",
  ];

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
    notifyListeners();
  }

  Future<void> launchWhatsapp() async {
    String phoneNumber = '+905078590490';
    String message = 'Test Mesajı';

    String url = 'https://wa.me/$phoneNumber/?text=${Uri.encodeFull(message)}';

    // URL'yi açın
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      debugPrint('WhatsApp bağlantısını açarken hata oluştu');
    }
  }

  void dropdownCallBack(String? selectedValue) {
    if (selectedValue is String) {
      dropdownValue = selectedValue;
      notifyListeners();
    }
  }

  void dropdownCallBack2(String? selectedValue2) {
    if (selectedValue2 is String) {
      dropdownValue2 = selectedValue2;
      notifyListeners();
    }
  }

  notifyListeners();
}
