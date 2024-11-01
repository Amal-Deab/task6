import 'package:api_focal/core/const_data/app_color.dart';
import 'package:api_focal/core/const_data/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controller/on_boarding_controller.dart';

Widget buildPageView(
  BuildContext context, {
  required String? title,
  String? subtitle,
  required String? buttonText,
  required VoidCallback onTap,
  required int index,
}) {
  return Stack(
    alignment: Alignment.center,
    children: [

      if (index == 0) ...[
        Positioned(top: 419, child: SvgPicture.asset(AppImage.vec1)),
        Positioned(
          top: 165.h,
          left: 270.w,
          child: SvgPicture.asset(
            AppImage.smile,
            color: Colors.white.withOpacity(0.5),
          ),
        ),
        Positioned(
          top: 106.h,
          left: 69.w,
          child: SvgPicture.asset(
            AppImage.vec2,
            color: Colors.white,
          ),
        ),
        Positioned(
          top: 545.h,
          left: 278.w,
          child: Transform.rotate(
            angle: -180.25,
            child: SvgPicture.asset(
              AppImage.vec3,
              color: Colors.white.withOpacity(0.5),
            ),
          ),
        ),
        Positioned(
          top: 600.h,
          left: 30.w,
          child: SvgPicture.asset(
            AppImage.vec3,
            color: Colors.white.withOpacity(0.5),
          ),
        ),
      ],


      if (index == 1) ...[
        Positioned(
          top: 110.h,
          left: 304.w,
          child: SvgPicture.asset(
            AppImage.smile,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
        Positioned(
          top: 116.h,
          left: 36.w,
          child: Transform.rotate(
            angle: -180.25,
            child: SvgPicture.asset(
              AppImage.vec3,
              width: 90,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ),
      ],


      if (index == 2) ...[
        Positioned(
          top: 108.h,
          left: 56.w,
          child: SvgPicture.asset(
            AppImage.smile,
            width: 77,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ],

 
      Positioned(
        top: 571.h,
        child: SmoothPageIndicator(
          controller: Get.find<OnBoardingController>().pageController,
          count: 3,
          effect: ExpandingDotsEffect(
            dotHeight: 7,
            dotWidth: 25,
            activeDotColor: Colors.white,
            dotColor: AppColor.primarycolor,
            expansionFactor: 2,
          ),
        ),
      ),

  
      if (subtitle != null) ...[
        Positioned(
          top: 420.h,
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ],

 
      Positioned(
        top: 300.h,
        child: Text(
          title!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 30,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
      ),

 
      Positioned(
        bottom: 15,
        left: 5,
        right: 5,
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Text(
                  buttonText!,
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
