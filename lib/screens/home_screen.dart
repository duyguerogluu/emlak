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

import 'package:carousel_slider/carousel_slider.dart';
import 'package:emlak/components/advert_card.dart';
import 'package:emlak/components/advert_card_detail.dart';
import 'package:emlak/components/drawer_menu.dart';
import 'package:emlak/components/find_for_me.dart';
import 'package:emlak/functions/duygu_nav.dart';
import 'package:emlak/screens/advert_card_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Drawer Menü',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: Text('Ana Sayfa'),
                onTap: () {
                  Navigator.pop(context);
                  debugPrint('Ana Sayfa seçildi');
                },
              ),
              ListTile(
                title: Text('Ayarlar'),
                onTap: () {
                  Navigator.pop(context);
                  debugPrint('Ayarlar seçildi');
                },
              ),
              ListTile(
                title: Text('Benim İçin Bul'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    debugPrint("benim için bula basıldı!!!!1");
                    showDialog(context: context, builder: (c) => FindForMe());
                  },
                  icon: const Icon(Icons.search, color: Colors.white),
                  label: const Text(
                    "Parselya Benim İçin Bul",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 5, 111, 9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    labelText: 'Uygun İlanı Ara',
                    hintText: 'Arama için yaz',
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
              CarouselSlider(
                items: [
                  for (int i = 0; i < 4; i++)
                    GestureDetector(
                      onTap: () {
                        //DuyguNav.push(const AdvertDetailScreen());
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.black45, BlendMode.darken),
                              image: AssetImage('assets/images/logo.jpeg')),
                          // boxShadow: [
                          //   BoxShadow(
                          //       color: Colors.grey,
                          //       spreadRadius: 2,
                          //       blurRadius: 8,
                          //       offset: Offset(4, 4))
                          // ],
                        ),
                        child: Text(
                          'Öne Çıkan İlanlar ${i + 1}',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    )
                ],
                options: CarouselOptions(),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
              //   child: SizedBox(
              //     height: MediaQuery.of(context).size.height / 1.8,
              //     child: ListView(
              //       children: List.generate(10, (i) => const AdvertCard()),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
