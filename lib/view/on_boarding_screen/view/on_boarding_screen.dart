import 'package:api_focal/core/servies/my_services.dart';
import 'package:api_focal/core/servies/shared_prefernces.dart';
import 'package:api_focal/view/login_screen/view/login_screen.dart';
import 'package:api_focal/view/on_boarding_screen/controller/on_boarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/const_data/app_color.dart';
import '../widgets/page_view.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(
      init: OnBoardingController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.back_ground_black,
          body: PageView.builder(
            controller: controller.pageController,
            itemCount: controller.pages.length,
            onPageChanged: (index) {
              controller.onPageChanged(index);
            },
            itemBuilder: (context, index) {
              final page = controller.pages[index];
              return buildPageView(
                context,
                title: page['title'],
                subtitle: page['subtitle'],
                buttonText: page['buttonText'],
                onTap: () {
                  if (index == controller.pages.length - 1) {
                    Get.offAll(LogInScreen());
                    MyServices.saveValue(
                        SharedPreferencesKey.isBoarding, 'done');
                  } else {
                    controller.pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  }
                },
                index: index,
              );
            },
          ),
        );
      },
    );
  }
}
