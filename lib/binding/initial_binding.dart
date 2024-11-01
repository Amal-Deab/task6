import 'package:api_focal/view/notification_screen/controller/notification_controller.dart';
import 'package:get/get.dart';

import '../core/class/crud.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    //  Get.put(NotificationController());
  }
}
