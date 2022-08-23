import 'package:get/get.dart';

class Authcontroller extends GetxController {
  bool isVisibilty = false;
  bool isCheckbox = false;

  Future<void> Visibilty() async {
    isCheckbox = !isCheckbox;
    update();
  }

  Future<void> Checkbox() async {
    isCheckbox = !isCheckbox;
    update();
  }
}

//GetxBuilder

//Obx