import 'package:get/get.dart';
import 'package:shopapp/Models/product_models.dart';
import 'package:shopapp/services/category_services.dart';

class CategoryController extends GetxController {
  var categoryNameList = <String>[].obs;
  var isCategoryLoading = true.obs;
  var categoryList = <ProductModels>[].obs;
  List<String> imageCategory = [
    "https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_.jpg",
    "https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
    "https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg",
  ].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategory();
  }

  void getCategory() async {
    var categoryName = await CategoryServices.getCategory();
    try {
      isCategoryLoading(true);
      if (categoryName.isNotEmpty) {
        categoryNameList.addAll(categoryName);
      }
    } finally {
      isCategoryLoading(false);
    }
  }

  getAllCategory(String nameCategory) async {
    isCategoryLoading(true);
    categoryList.value = await AllCategoryServices.getAllCategory(nameCategory);
    isCategoryLoading(false);
    update();
  }

  getCategoryIndex(int index) async {
    var categoryAllName = await getAllCategory(categoryNameList[index]);
    isCategoryLoading(true);
    if (categoryAllName != null) {
      categoryList.value = categoryAllName;
    }
    isCategoryLoading(false);
    update();
  }
}
