import 'package:emlak/components/loading_popup.dart';
import 'package:emlak/service/service.dart';
import 'package:flutter/material.dart';

class SignupRiverpod extends ChangeNotifier {
  TextEditingController adi = TextEditingController();
  TextEditingController soyadi = TextEditingController();
  TextEditingController telefon = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController sifre = TextEditingController();

  Future<void> fetchSignup(BuildContext context) async {
    debugPrint("fetchSignup çalıştı");
    loadingPopup();

    var result = await Service.signupCall(
      adi: adi.text,
      soyadi: soyadi.text,
      email: email.text,
      telefon: telefon.text,
      sifre: sifre.text,
    );

    //Grock.toRemo
  }
}
