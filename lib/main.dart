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
