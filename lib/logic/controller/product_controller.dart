import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopapp/Models/product_models.dart';
import 'package:shopapp/services/product_services.dart';

class ProductController extends GetxController {
  var productsList = <ProductModels>[].obs;
  var favoriteList = <ProductModels>[].obs;
  var storage = GetStorage();
  var isLoading = true.obs;
  var searchList = <ProductModels>[].obs;
  TextEditingController searchcontroller = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    //storage hasn't been fixed yet
    List? storedShoppings = storage.read<List>("isFavoritesList");
    if (storedShoppings != null) {
      favoriteList =
          storedShoppings.map((e) => ProductModels.fromJson(e)).toList().obs;
    }
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

  //favorite logic
  void manageFavorite(int productId) async {
    var existingIndex =
        favoriteList.indexWhere((element) => element.id == productId);
    print(existingIndex);
    if (existingIndex >= 0) {
      //delete duplicate products
      favoriteList.removeAt(existingIndex);
      await storage.remove("isFavoritesList");
    } else {
      //add list product
      favoriteList
          .add(productsList.firstWhere((element) => element.id == productId));
      await storage.write("isFavoritesList", favoriteList);
    }
  }

  bool isFavorites(int productId) {
    return favoriteList.any((element) => element.id == productId);
  }
  //Search logic

  void addSearchToList(String searchName) {
    searchName = searchName.toLowerCase();
    searchList.value = productsList.where((search) {
      var searchPrice = search.price.toString().toLowerCase();
      var searchTitle = search.title.toLowerCase();
      return searchTitle.contains(searchName) ||
          searchPrice.toString().contains(searchName);
    }).toList();
    update();
  }

  void clearSearch() {
    searchcontroller.clear();
    addSearchToList("");
  }
}
