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

import 'dart:ffi';

import 'package:emlak/riverpod/riverpod_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_button/group_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class FindForMe extends ConsumerStatefulWidget {
  const FindForMe({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FindForMeState();
}

class _FindForMeState extends ConsumerState<FindForMe> {
  final _pageController = PageController();
  final controller = GroupButtonController();

  @override
  Widget build(BuildContext context) {
    var watch = ref.watch(findForMe);
    var read = ref.read(findForMe);
    int i = 0;
    return AlertDialog(
      content: SingleChildScrollView(
        child: SizedBox(
          height: 500,
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SmoothPageIndicator(
                controller: _pageController,
                count: 6,
                effect: const WormEffect(
                  dotHeight: 16,
                  dotWidth: 16,
                  type: WormType.thinUnderground,
                ),
              ),
              Expanded(
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  children: [
                    //1. Sayfa
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Hemen Seçimini Yaparak Başla",
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Color.fromARGB(114, 4, 89, 7)),
                        ),
                        Padding(padding: EdgeInsets.all(8.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _getFindForMeButton(
                                icon: Icons.home,
                                label: "Satılık Arıyorum",
                                onPressed: () {
                                  _pageController.nextPage(
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeInOut,
                                  );
                                }),
                            _getFindForMeButton(
                                icon: Icons.home,
                                label: "Kiralık Arıyorum",
                                onPressed: () {}),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _getFindForMeButton(
                                icon: Icons.home,
                                label: "Satmak İstiyorum",
                                onPressed: () {}),
                            _getFindForMeButton(
                                icon: Icons.home,
                                label: "Kiraya Veriyorum",
                                onPressed: () {}),
                          ],
                        ),
                      ],
                    ),
                    //2.Sayfa
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            "İlgilendiğin Gayrimenkul Tipi",
                            style: TextStyle(
                                fontSize: 14.8,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(114, 4, 89, 7)),
                          ),
                        ),
                        Container(
                          width: 220,
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: DropdownButton(
                            isExpanded: true,
                            //dropdownColor: Colors.white,
                            items: [
                              DropdownMenuItem(
                                child: Text("Konut"),
                                value: "konut",
                              ),
                              DropdownMenuItem(
                                child: Text("İş Yeri"),
                                value: "isyeri",
                              ),
                              DropdownMenuItem(
                                child: Text("Arsa"),
                                value: "arsa",
                              ),
                            ],
                            value: read.dropdownValue,
                            onChanged: watch.dropdownCallBack,
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 42,
                            underline: SizedBox(),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 220,
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: DropdownButton(
                            isExpanded: true,
                            alignment: AlignmentDirectional.center,
                            items: [
                              DropdownMenuItem(
                                child: Text("Daire"),
                                value: "daire",
                              ),
                              DropdownMenuItem(
                                child: Text("Müstakil"),
                                value: "mustakil",
                              ),
                              DropdownMenuItem(
                                child: Text("Villa"),
                                value: "villa",
                              ),
                            ],
                            value: read.dropdownValue2,
                            onChanged: watch.dropdownCallBack2,
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 42,
                            underline: SizedBox(),
                          ),
                        ),
                      ],
                    ),
                    //3.Sayfa
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            "Oda Sayısı İçin Seçim Yapın",
                            style: TextStyle(
                                fontSize: 14.8,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(114, 4, 89, 7)),
                          ),
                        ),
                        Column(
                          children: [
                            GroupButton(
                              controller: controller,
                              buttons: [
                                '1+0',
                                '1+1',
                                '2+1',
                                '2+2',
                                '2+2',
                                '3+1',
                                '3+2',
                                '4+1',
                                '4+2',
                                '5+1',
                                '6+',
                              ],
                            ),
                            TextButton(
                              onPressed: () {
                                controller.selectIndex(1);
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeInOut,
                                );
                              },
                              child: const Text('Seçimim Tamam'),
                            )
                          ],
                        ),
                      ],
                    ),
                    //4.Sayfa
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            "İl İlçe",
                            style: TextStyle(
                                fontSize: 14.8,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(114, 4, 89, 7)),
                          ),
                        ),
                        Container(
                          width: 220,
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: DropdownButton(
                            isExpanded: true,
                            //dropdownColor: Colors.white,
                            items: [
                              DropdownMenuItem(
                                child: Text("Mersin"),
                                value: "konut",
                              ),
                              DropdownMenuItem(
                                child: Text("Kütahya"),
                                value: "isyeri",
                              ),
                              DropdownMenuItem(
                                child: Text("Antalya"),
                                value: "arsa",
                              ),
                            ],
                            value: read.dropdownValue,
                            onChanged: watch.dropdownCallBack,
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 42,
                            underline: SizedBox(),
                          ),
                        ),
                      ],
                    ),
                    //5.Sayfa
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            "Bütçenizin %20lik oranına yakın bütçeli evler sunulacaktır.",
                            style: TextStyle(
                                fontSize: 14.8,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(114, 4, 89, 7)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextField(
                            // controller: _controller,
                            decoration: const InputDecoration(
                              labelText: 'Bütçeniz',
                              hintText: 'Bütçeniz',
                              suffixText: 'TL',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //6. Sayfa
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "ÖZet Bilgi",
                            style: TextStyle(
                                fontSize: 14.8,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(114, 4, 89, 7)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "Satılık ",
                            style: TextStyle(
                                fontSize: 14.8,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "Konut",
                            style: TextStyle(
                                fontSize: 14.8,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "Daire",
                            style: TextStyle(
                                fontSize: 14.8,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "3+1",
                            style: TextStyle(
                                fontSize: 14.8,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "Mersin Silifke",
                            style: TextStyle(
                                fontSize: 14.8,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "20000000 TL",
                            style: TextStyle(
                                fontSize: 14.8,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            _makePhoneCall('+905078590490');
                          },
                          icon: Icon(Icons.phone),
                          label: Text("İletişime Geçin"),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Tercihleri Kaydet"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      try {
                        FocusScope.of(context).unfocus(); //Klavye kapandı
                      } catch (e) {}

                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back),
                        Padding(padding: EdgeInsets.only(right: 8)),
                        Text("GERİ"),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(right: 8)),
                  ElevatedButton(
                    onPressed: () {
                      try {
                        FocusScope.of(context).unfocus(); //Klavye kapandı
                      } catch (e) {}

                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Row(
                      children: [
                        Text("İLERİ"),
                        Padding(padding: EdgeInsets.only(right: 8)),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Widget _getFindForMeButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Flexible(
      child: InkWell(
        onTap: onPressed,
        child: SizedBox(
          height: 100,
          width: 200,
          child: Card(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(icon, size: 36.0, color: Colors.black54),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
