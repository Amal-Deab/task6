import 'package:api_focal/core/const_data/app_color.dart';
import 'package:api_focal/core/const_data/app_image.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controller/bottom_navigation_bar_controller.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationBarController>(
        init: BottomNavigationBarController(),
        builder: (controller) {
          return Scaffold(
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      //   color:  Color.fromARGB(255, 131, 166, 230),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CurvedNavigationBar(
                      buttonBackgroundColor: AppColor.primarycolor,
                      animationCurve: Curves.easeInOutCirc,
                      //     color: Color.fromARGB(255, 131, 166, 230),
                      backgroundColor: Color.fromARGB(255, 255, 254, 254),
                      height: 50,
                      key: controller.bottomNavigationKey,
                      items: <Widget>[
                        SvgPicture.asset(
                          AppImage.home,
                          color: AppColor.subTitleColor,
                        ),
                        SvgPicture.asset(AppImage.search),
                        SvgPicture.asset(AppImage.notf_icon),
                      ],
                      onTap: (index) {
                        controller.onTap(index);
                      },
                    ),
                  ),
                ),
              ),
              body: controller.pages[controller.page]);
        });
  }
}
