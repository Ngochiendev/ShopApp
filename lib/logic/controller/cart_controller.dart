import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/Models/product_models.dart';
import 'package:shopapp/ultils/theme.dart';

class CartController extends GetxController {
  var productsMap = {}.obs;

  void addProductToCart(ProductModels productModels) {
    if (productsMap.containsKey(productModels)) {
      productsMap[productModels] += 1;
    } else {
      productsMap[productModels] = 1;
    }
  }

  void removeProductToCart(ProductModels productModels) {
    if (productsMap.containsKey(productModels) &&
        productsMap[productModels] == 1) {
      productsMap.removeWhere((key, value) => key == productModels);
    } else {
      productsMap[productModels] -= 1;
    }
  }

  void removeOneProduct(ProductModels productModels) {
    productsMap.removeWhere((key, value) => key == productModels);
  }

  void clearAllProduct() {
    Get.defaultDialog(
      title: 'Clear Products',
      titleStyle: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 130, 233, 195),
      ),
      middleText: 'Are you sure need clear product?',
      middleTextStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Color.fromARGB(255, 130, 233, 195),
      ),
      radius: 22,
      textCancel: ' No ',
      cancelTextColor: const Color.fromARGB(255, 130, 233, 195),
      onCancel: () {
        Get.toNamed('cartScreen');
      },
      textConfirm: ' Yes ',
      confirmTextColor: Colors.white,
      titlePadding: const EdgeInsets.symmetric(vertical: 15),
      buttonColor: mainColor,
      onConfirm: () {
        productsMap.clear();
        Get.back();
      },
    );
  }

  get productSubTotal =>
      productsMap.entries.map((e) => e.key.price * e.value).toList();

  get total => productsMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  int quantity() {
    if (productsMap.isEmpty) {
      return 0;
    } else {
      return productsMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  }
}
