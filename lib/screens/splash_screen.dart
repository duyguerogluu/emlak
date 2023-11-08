import 'package:emlak/functions/duygu_nav.dart';
import 'package:emlak/screens/base_scafold.dart';
import 'package:flutter/material.dart';

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
        const Duration(seconds: 3),
        () => DuyguNav.pushAndPopBack(const BaseScaffold()),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 16.0, end: 36),
          duration: const Duration(seconds: 2),
          builder: (BuildContext context, double size, Widget? child) {
            return Text(
              'Hoşgeldiniz',
              style: TextStyle(fontSize: size, color: Colors.blue),
            );
          },
        ),
      ),
    );
  }
}
