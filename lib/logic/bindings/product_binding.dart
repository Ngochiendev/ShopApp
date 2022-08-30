import 'package:get/get.dart';
import 'package:shopapp/logic/controller/product_controller.dart';

class ProductBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ProductController());
  }
}
