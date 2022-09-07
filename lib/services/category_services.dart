import 'package:http/http.dart' as http;
import 'package:shopapp/Models/category_models.dart';
import 'package:shopapp/Models/product_models.dart';

class CategoryServices {
  static Future<List<String>> getCategory() async {
    try {
      var response = await http
          .get(Uri.parse('https://fakestoreapi.com/products/categories'));
      if (response.statusCode == 200) {
        final jsonData = response.body;
        print(jsonData);
        return categoryModelsFromJson(jsonData).toList();
      } else {
        print(response.statusCode.toString());
        throw Exception(
            'Failed load data with status code ${response.statusCode}');
      }
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}

class AllCategoryServices {
  static Future<List<ProductModels>> getAllCategory(
      String caterogyNames) async {
    try {
      var response = await http
          .get(Uri.parse('http://fakestoreapi.com/products/category/$caterogyNames'));
      if (response.statusCode == 200) {
        final jsonData = response.body;

        print(jsonData);
        return productModelsFromJson(jsonData).toList();
      } else {
        print(response.statusCode.toString());
        throw Exception(
            'Failed load data with status code ${response.statusCode}');
      }
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}
