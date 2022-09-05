import 'package:flutter/material.dart';
import 'package:shopapp/Models/product_models.dart';
import 'package:shopapp/View/widgets/productDetail/add_cart.dart';
import 'package:shopapp/View/widgets/productDetail/clothes_info.dart';
import 'package:shopapp/View/widgets/productDetail/image_slider.dart';
import 'package:shopapp/View/widgets/productDetail/size_list.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key, required this.productModels})
      : super(key: key);
  final ProductModels productModels;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ImageSlider(imageUrl: productModels.image),
              ClothesInfo(
                title: productModels.title,
                productID: productModels.id,
                rating: productModels.rating.rate,
                decriptions: productModels.description,
              ),
              const SizedList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: AddCart(
          price: productModels.price,
          productModels: productModels,
        ),
      ),
    );
  }
}
