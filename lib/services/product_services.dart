import 'package:http/http.dart' as http;
import 'package:shopapp/Models/product_models.dart';

class ProductServices {
  static Future<List<ProductModels>> getProduct() async {
    try {
      var response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
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
