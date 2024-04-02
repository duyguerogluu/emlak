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

import 'package:emlak/components/advert_card.dart';
import 'package:emlak/components/advert_card_detail.dart';
import 'package:emlak/functions/duygu_nav.dart';
import 'package:emlak/screens/advert_screen.dart';
import 'package:emlak/screens/home_screen.dart';
import 'package:emlak/screens/photo_gallery_screen.dart';
import 'package:emlak/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'emlak',
      initialRoute: '/splash',
      routes: {
        'advert': (context) => const AdvertScreen(),
        '/splash': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
        '/photogallery': (context) => const PhotoGalleryScreen(),
      },
      debugShowCheckedModeBanner: false,
      navigatorKey: DuyguNav.navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 8, 93, 11)),
        useMaterial3: true,
      ),
    );
  }
}
