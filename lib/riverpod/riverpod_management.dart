import 'package:emlak/riverpod/announcement_riverpod.dart';
import 'package:emlak/riverpod/bottom_nav_bar_riverpod.dart';
import 'package:emlak/riverpod/find_for_me_riverpod.dart';
import 'package:emlak/riverpod/login_riverpod.dart';
import 'package:emlak/riverpod/offer_riverpod.dart';
import 'package:emlak/riverpod/signup_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavBarRiverpod =
    ChangeNotifierProvider((_) => BottomNavBarRiverpod());

final findForMe = ChangeNotifierProvider((_) => FindForMeRiverpod());
final login = LoginRiverpod();
final signup = ChangeNotifierProvider((_) => SignupRiverpod());
final announcement = AnnouncementRiverpod();
final offer = OfferRiverpod();
