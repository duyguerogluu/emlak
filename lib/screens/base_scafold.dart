import 'package:emlak/functions/duygu_nav.dart';
import 'package:emlak/riverpod/riverpod_management.dart';
import 'package:emlak/screens/advert_screen.dart';
import 'package:emlak/screens/user_setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';


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
    //var childButtons = List<UnicornButton>();
    return Scaffold(
      // bottomNavigationBar: const BottomNavBar(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     watchF.makePhoneCall(phoneNumber);
      //   },
      //   child: Icon(Icons.phone),
      // ),


      floatingActionButton: SpeedDial(
        icon: Icons.phone_iphone_outlined,
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
