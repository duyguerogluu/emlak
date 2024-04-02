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
