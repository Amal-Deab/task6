import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/const_data/app_image.dart';

Widget TitleQuickSearch(String title, void Function()? onTap) {
  return Column(
    children: [
      SizedBox(
        height: 10,
      ),
      GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            SvgPicture.asset(AppImage.time),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 10,
      ),
    ],
  );
}
