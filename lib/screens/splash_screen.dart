import 'package:emlak/functions/duygu_nav.dart';
import 'package:emlak/loginPage/login_page.dart';
import 'package:emlak/screens/base_scafold.dart';
import 'package:emlak/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async => Future.delayed(
        const Duration(seconds: 4),
        () => DuyguNav.pushAndPopBack(const LoginPage()),
      );

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 40.0, end: 300.0),
          duration: const Duration(seconds: 3),
          builder: (BuildContext context, double size, Widget? child) {
            return Image.asset("assets/images/logorb.png", width: size);
          },
        ),
      ),
    );
  }
}
