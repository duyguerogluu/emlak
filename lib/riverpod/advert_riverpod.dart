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
