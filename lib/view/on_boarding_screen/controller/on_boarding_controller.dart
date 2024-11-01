import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  PageController pageController = PageController();
  int currentPageIndex = 0;

  final List<Map<String, String?>> pages = [
    {
      'title': 'Welcome To \n Programmer Store',
      'subtitle': null,
      'buttonText': 'Get Started',
    },
    {
      'title': 'Let’s Start Journey',
      'subtitle': 'Smart, Gorgeous & Fashionable \n Collection Explore Now',
      'buttonText': 'Next',
    },
    {
      'title': 'You Have the\n Power To',
      'subtitle':
          'There Are Many Beautiful And Attractive\n Plants To Your Room',
      'buttonText': 'Next',
    },
  ];

  void onPageChanged(int index) {
    currentPageIndex = index;
    update();
  }
}
