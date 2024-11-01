import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/const_data/app_color.dart';
import '../../core/const_data/app_image.dart';
import 'custom_button.dart';

Widget LoginGoogle() {
  return Column(
    children: [
      SizedBox(
        height: 10,
      ),
      CustomButton(
        buttonContent: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImage.google),
            SizedBox(
              width: 10,
            ),
            Text(
              'Sign up with Google',
              style: TextStyle(
                color: AppColor.blacktext,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
        color: AppColor.background_color,
      ),
    ],
  );
}
