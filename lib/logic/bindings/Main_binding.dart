import 'package:get/get.dart';
import 'package:shopapp/logic/controller/main_controller.dart';
import 'package:shopapp/logic/controller/payment_controller.dart';
import 'package:shopapp/logic/controller/setting_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingController());
    Get.put(PaymentController(), permanent: true);
  }
}
