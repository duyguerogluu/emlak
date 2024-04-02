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

import 'package:emlak/models/advert_model.dart';
import 'package:emlak/service/service.dart';
import 'package:flutter/material.dart';

class AdvertRiverpod extends ChangeNotifier {
  Future<List<AdvertModel>?> getAdverts() async {
    debugPrint("postAdvert çalıştı!!!!!!!!!!!!!!!!!!!!!!!!");

    try {
      var value = await Service.advertCall();
      if (value != null) {
        return value;
      } else {
        debugPrint("Değerler null dönüyo napalımmm!!!!!!!!");
      }
    } catch (error, stackTrace) {
      debugPrint("Hata oluştu: $error");
      debugPrint(stackTrace.toString());
    }
  }

  Future<AdvertModel?> postAdvert(AdvertModel advert) async {
    debugPrint("postAdvert çalıştı!!!!!!!!!!!!!!!!!!!!!!!!");

    try {
      var value = await Service.advertAdd(advert);
      if (value != null) {
        return value;
      } else {
        debugPrint("Değerler null dönüyo napalımmm!!!!!!!!");
      }
    } catch (error, stackTrace) {
      debugPrint("Hata oluştu: $error");
      debugPrint(stackTrace.toString());
    }
    return null;
  }
}
