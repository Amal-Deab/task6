import 'package:api_focal/view/home_screen/view/home_screen.dart';
import 'package:api_focal/view/on_boarding_screen/view/on_boarding_screen.dart';
import 'package:get/get.dart';

import 'view/splash_screen/view/splash_screen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: '/splashScreen',
    page: () => SplashScreen(),
  ),
  GetPage(
    name: '/onBoardingScreen',
    page: () => OnBoardingScreen(),
  ),
  GetPage(
    name: '/homeScreen',
    page: () => HomeScreen(),
  ),
];
