import 'package:api_focal/core/const_data/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListTileNotification extends StatelessWidget {
  final String title;
  final String subtitle;
  String price = '';
  final String timeReceived;
  final image;
  final bool read_notification;

  ListTileNotification({
    required this.price,
    required this.title,
    required this.subtitle,
    required this.timeReceived,
    this.image,
    required this.read_notification,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105.h,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: read_notification ? AppColor.background_color : Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 88.w,
              height: 85.h,
              decoration: BoxDecoration(
                color: read_notification
                    ? Colors.white
                    : AppColor.background_color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  image,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                    overflow: TextOverflow.clip,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                        overflow: TextOverflow.visible,
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Expanded(
                        child: Text(
                          subtitle,
                          style: TextStyle(
                              fontSize: 11.sp,
                              fontFamily: 'Poppins',
                              color: Color(0xFF707B81),
                              fontWeight: FontWeight.w600),
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              textAlign: TextAlign.start,
              timeReceived,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF707B81),
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
