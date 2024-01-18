import 'package:emlak/models/annoucement_model.dart';
import 'package:emlak/service/service.dart';
import 'package:flutter/material.dart';

class AnnouncementRiverpod extends ChangeNotifier {
  Future<List<AnnouncementModel>?> getAnnouncement() async {
    debugPrint("getchannoucement çalıştııı !!!!!!!!!!!!!!!!!");

    //   var value = await Service.announcementCall();

    //   if (value != null) {
    //     return value;
    //   } else {
    //     debugPrint("Değerler null dönüyo napalımmm!!!!!!!!");
    //   }
    // } catch (error, stackTrace) {
    //   debugPrint("Hata oluştu: $error");
    //   debugPrint(stackTrace.toString());
    // }

    return null;
  }
}
