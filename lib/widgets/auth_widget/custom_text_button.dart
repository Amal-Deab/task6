
import 'package:api_focal/view/login_screen/view/login_screen.dart';
import 'package:api_focal/view/sign_up_screen/view/sing_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/const_data/app_color.dart';

class CustomTextButton extends StatelessWidget {

  final bool isLoginScreen;
  const CustomTextButton({super.key, required this.isLoginScreen, });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        isLoginScreen ? 'New User?' : 'Already Have Account?',
        style: TextStyle( color:AppColor.grey_text,fontWeight:FontWeight.w500,fontSize:16),
      ),
      TextButton(
        child: Text(
          isLoginScreen ? 'Create Account' : 'Log In',
          style: TextStyle(color: Colors.black,fontWeight:FontWeight.w400,fontSize:16),
        ),
        onPressed: () => isLoginScreen?Get.off(SignUpScreen()):Get.off(LogInScreen()),
      )
    ],
  ));
  }
}
