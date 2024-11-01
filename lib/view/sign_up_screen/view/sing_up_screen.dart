import 'package:api_focal/core/const_data/app_color.dart';
import 'package:api_focal/utli/them/app_text_style.dart';
import 'package:api_focal/view/login_screen/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/app_bar_icon.dart';
import '../../../widgets/auth_widget/custom_button.dart';
import '../../../widgets/auth_widget/custom_text_button.dart';
import '../../../widgets/auth_widget/login_google_button.dart';
import '../../../widgets/auth_widget/text_field_column.dart';
import '../../../widgets/loading_widget.dart';
import '../controller/sign_up_controller.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
        init: SignUpController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                backgroundColor: controller.isLoading
                    ? Colors.black.withOpacity(0.5)
                    : Colors.white,
                leading: AppBarIcon(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 15,
                    ),
                    onPressed: () {
                      Get.off(LogInScreen());
                    })),
            body: SafeArea(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: controller.formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Center(
                              child: Text('Register Account',
                                  style: AppTextStyle.authTitleStyle),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text(
                                'Fill your details or continue \nwith social media',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColor.subTitleColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            TextFieldColumn(
                              emailController: controller.emailController,
                              passWordController: controller.passWordController,
                              obscureText: controller.obscureText,
                              isloginScreen: false,
                              changeObscureText: () =>
                                  controller.changeObscureText(),
                              nameController: controller.nameController,
                            ),
                            CustomButton(
                              color: AppColor.primarycolor,
                              buttonContent: Text(
                                'Sign Up',
                                style: AppTextStyle.buttonStyle
                              ),
                              onTap: () {
                                controller.signUp();
                              },
                            ),
                            LoginGoogle(),
                            SizedBox(
                              height: 30,
                            ),
                            CustomTextButton(
                              isLoginScreen: false,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (controller.isLoading) LoadingWidget(),
                ],
              ),
            ),
          );
        });
  }
}
