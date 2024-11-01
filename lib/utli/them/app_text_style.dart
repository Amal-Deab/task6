import 'package:flutter/material.dart';

import '../../core/const_data/app_color.dart';

class AppTextStyle {
  static TextStyle appStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 18,
    color: AppColor.blacktext,
  );

  static TextStyle authTitleStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30,
    color: AppColor.blacktext,
  );

  static TextStyle buttonStyle = TextStyle(
    fontSize: 16,
    color: AppColor.white,
    fontWeight: FontWeight.w400
  );
}
