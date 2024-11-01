import 'package:api_focal/core/const_data/const_data.dart';

import 'package:api_focal/view/login_screen/view/login_screen.dart';
import 'package:api_focal/view/on_boarding_screen/view/on_boarding_screen.dart';
import 'package:get/get.dart';

import '../../bottom_navigation_bar/view/bottom_navigation_bar_Screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    super.onInit();

/*     //  var user = ConstData.user;
    if (ConstData.user != null) {
      var user = ConstData.user;
      print('user-----------------------');
      print(user);
    } else {
      print('User is not initialized');
    } */
    var token = ConstData.token;
    var isBoarding = ConstData.isBoarding;
    print('bbbbbbbbbbbbbbbbbbbbbbbbbbb');
    print(isBoarding);
    print('tttttttttttttt');
    print(token);
   
    Future.delayed(Duration(seconds: 3), () {
      if (token == '' && isBoarding != 'done') {
        Get.off(OnBoardingScreen());
      } else if (token == '' && isBoarding == 'done') {
        Get.off(LogInScreen());
      } else {
        Get.off(BottomNavigationBarScreen());
      }
    });
  }
}
