import 'package:get/get.dart';
import 'package:shopapp/logic/controller/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Authcontroller());
  }
}
