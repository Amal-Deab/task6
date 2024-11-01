
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../../core/servies/my_services.dart';
import '../../../model/notification_model.dart';


class NotificationController extends GetxController {
  List<NotificationModel> notifications = [];

  @override
  void onInit() async {
    super.onInit();

    notifications = await MyServices().getNotificationList();
    update();
  }

  Future<void> addNotifications(String title, String subtitle) async {
    var newNotification = NotificationModel(
      title: title,
      subtitle: subtitle,
      timeReceived: DateTime.now(),
    );

    notifications.add(newNotification);

    await MyServices().saveNotificationList(notifications);

    update();
  }

  Future<void> deleteNotifications() async {
    notifications.clear();
    await MyServices().saveNotificationList(notifications);
    update();
  }



}


