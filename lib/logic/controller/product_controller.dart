import 'package:get/get.dart';
import 'package:shopapp/Models/product_models.dart';
import 'package:shopapp/services/product_services.dart';

class ProductController extends GetxController {
  var productsList = <ProductModels>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  void getProducts() async {
    var product = await ProductServices.getProduct();
    try {
      isLoading(true);
      if (product.isNotEmpty) {
        productsList.addAll(product);
      }
    } finally {
      isLoading(false);
    }

    update();
  }
}
