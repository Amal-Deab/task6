import 'package:api_focal/core/const_data/app_color.dart';
import 'package:api_focal/core/const_data/app_image.dart';
import 'package:api_focal/view/bottom_navigation_bar/view/bottom_navigation_bar_Screen.dart';
import 'package:api_focal/widgets/app_bar_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../utli/them/app_text_style.dart';
import '../controller/notification_controller.dart';
import '../widget/list_tile_notification.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      init: NotificationController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.background_color,
          appBar: AppBar(
            backgroundColor: AppColor.background_color,
            centerTitle: true,
            actions: [
              AppBarIcon(
                icon: SvgPicture.asset(
                  AppImage.trash,
                  
                ),
              ),
            ],
            leading: AppBarIcon(
              onPressed: () => Get.off(BottomNavigationBarScreen()),
              icon: Icon(Icons.arrow_back_ios_sharp,
                  size: 15.sp, color:AppColor.blacktext),
            ),
            title: Text('Notifications', style: AppTextStyle.appStyle),
          ),
          body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                children: [
                  Text('Resent',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
                  ListTileNotification(
                    price: '',
                    image: AppImage.t_shirt,
                    read_notification: false,
                    title: 'Thanks you for purchasing',
                    subtitle: 'Your order will be shipped in 2-4 days',
                    timeReceived: '7 min ago',
                  ),
                  ListTileNotification(
                    price: '\$364.95 ',
                    image: AppImage.t_shirt2,
                    read_notification: true,
                    title: 'We Have New Products With Offers',
                    subtitle: '\$260.00 ',
                    timeReceived: '40 min ago',
                  ),
                  Text('Yesterday',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
                  ListTileNotification(
                    price: '\$364.95 ',
                    image: AppImage.t_shirt2,
                    read_notification: true,
                    title: 'We Have New Products With Offers',
                    subtitle: '\$260.00',
                    timeReceived: '40 min ago',
                  ),
                  ListTileNotification(
                    price: '\$364.95 ',
                    image: AppImage.t_shirt3,
                    read_notification: true,
                    title: 'We Have New Products With Offers',
                    subtitle: '\$260.00',
                    timeReceived: '40 min ago',
                  ),
                ],
              )),
        );
      },
    );
  }
}
