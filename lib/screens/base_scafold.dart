import 'package:emlak/functions/duygu_nav.dart';
import 'package:emlak/riverpod/riverpod_management.dart';
import 'package:emlak/screens/advert_screen.dart';
import 'package:emlak/screens/user_setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BaseScaffold extends ConsumerStatefulWidget {
  const BaseScaffold({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends ConsumerState<BaseScaffold> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var watch = ref.watch(bottomNavBarRiverpod);
    var watchF = ref.watch(findForMe);
    var phoneNumber = "050490";
    ValueNotifier<bool> isDialOpen = ValueNotifier(false);
    bool customDDialRoot = true;
    bool extend = false;
    bool rmIcons = false;

    //var childButtons = List<UnicornButton>();
    return Scaffold(
      // bottomNavigationBar: const BottomNavBar(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     watchF.makePhoneCall(phoneNumber);
      //   },
      //   child: Icon(Icons.phone),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: SpeedDial(
        icon: Icons.call_end,
        activeIcon: Icons.call,
        spacing: 3,
        childPadding: const EdgeInsets.all(4),
        buttonSize: Size.fromRadius(40),
        label: extend ? const Text("open") : null,
        activeLabel: extend ? const Text("close") : null,
        direction: SpeedDialDirection.up,
        switchLabelPosition: false,
        visible: true,
        closeManually: false,
        renderOverlay: true,
        onOpen: () => debugPrint("Opennind Dial"),
        onClose: () => debugPrint("Closed Dial"),
        useRotationAnimation: true,
        elevation: 8.0,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 500),
        isOpenOnStart: false,
        children: [
          SpeedDialChild(
            child: !rmIcons ? const Icon(Icons.phone) : null,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            onTap: () => setState(() {
              rmIcons = !rmIcons;
              watchF.makePhoneCall(phoneNumber);
            }),
          ),
          SpeedDialChild(
            child: !rmIcons ? const FaIcon(FontAwesomeIcons.whatsapp) : null,
            backgroundColor: const Color.fromARGB(1000, 77, 194, 71),
            foregroundColor: Colors.white,
            onTap: () => setState(() {
              rmIcons = !rmIcons;
              watchF.makePhoneCall(phoneNumber);
            }),
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Image.asset('assets/images/logorb.png'),
            ),
            ListTile(
              title: Text('Ana Sayfa'),
              onTap: () {
                Navigator.pop(context); // Drawer'ı kapat
                DuyguNav.push(AdvertScreen());
                print('Ana Sayfa seçildi');
              },
            ),
            ListTile(
              title: Text('Ayarlar'),
              onTap: () {
                Navigator.pop(context); // Drawer'ı kapat
                DuyguNav.push(UserSettingScreen());
                print('Ayarlar seçildi');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(watch.appbarTitle()),
        actions: <Widget>[
          watch.appbarIcon(),
        ],
      ),
      body: watch.body(),
    );
  }
}
