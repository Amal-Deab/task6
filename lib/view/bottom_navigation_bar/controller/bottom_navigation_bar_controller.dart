import 'package:api_focal/view/notification_screen/view/notification_screen.dart';
import 'package:api_focal/view/search_sceen/view/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../../home_screen/view/home_screen.dart';

class BottomNavigationBarController extends GetxController {
  int page = 0;
  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
  List<Widget> pages = [
    HomeScreen(),
   SearchScreen(),
   NotificationScreen(),
  ];

  onTap(index) {
    page = index;
    update();
  }
}
