import 'package:api_focal/utli/them/app_text_style.dart';
import 'package:api_focal/view/login_screen/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/const_data/app_color.dart';
import '../../../widgets/auth_widget/custom_button.dart';
import '../../../widgets/auth_widget/custom_text_button.dart';
import '../../../widgets/auth_widget/login_google_button.dart';
import '../../../widgets/auth_widget/text_field_column.dart';
import '../../../widgets/loading_widget.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
   backgroundColor:  controller.isLoading? Colors.black.withOpacity(0.5):Colors.white,
          ),
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
                              // title
                              Center(
                                child: Text(
                                  'Hello Again!',
                                  style: AppTextStyle.authTitleStyle
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              //sub title
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
                              // text field
                              TextFieldColumn(
                                emailController: controller.emailController,
                                passWordController: controller.passWordController,
                                obscureText: controller.obscureText,
                                isloginScreen: true,
                                changeObscureText: () => controller.changeObscureText(),
                              ),
                              CustomButton(
                                color: AppColor.primarycolor,
                                buttonContent: Text(
                                  'Sign In',
                                         style: AppTextStyle.buttonStyle
                                ),
                                onTap: () {
                                  controller.signIn();
                                },
                              ),
                              LoginGoogle(),
                              SizedBox(
                                height: 30,
                              ),
                              CustomTextButton(
                                isLoginScreen: true,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),     if (controller.isLoading) LoadingWidget(),
                  ],
                )
           
          ),
        );
      }
    );
  }
}
