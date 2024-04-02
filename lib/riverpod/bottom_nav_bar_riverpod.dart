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
import 'package:emlak/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBarRiverpod extends ChangeNotifier {
  BuildContext? context;
  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(
        CupertinoIcons.home,
        color: Colors.black54,
      ),
      label: "Anasayfa",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        CupertinoIcons.cart,
        color: Colors.black54,
      ),
      label: "Sepetim",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        CupertinoIcons.person,
        color: Colors.black54,
      ),
      label: "Profil",
    ),
  ];

  int currentIndex = 0;

  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  String appbarTitle() {
    switch (currentIndex) {
      case 1:
        return "Sepetim";
      case 2:
        return "Hesabım";
      case 0:
      default:
        return "Menü";
    }
  }

  Widget appbarIcon() {
    switch (currentIndex) {
      case 1:
        return const SizedBox();
      case 2:
        return IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {
          },
        );
      case 0:
      default:
        return IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {
          },
        );
    }
  }

  Widget body() {
    switch (currentIndex) {
      case 1:
        return const HomeScreen();
      case 2:
        return const HomeScreen();
      case 0:
      default:
        return HomeScreen();
    }
  }
}
