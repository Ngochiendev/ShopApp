import 'package:flutter/material.dart';
import 'package:shopapp/Models/product_models.dart';
import 'package:shopapp/View/widgets/productDetail/image_Slider.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key, required this.productModels})
      : super(key: key);
  final ProductModels productModels;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageSlider(
              imageUrl: productModels.image,
            ),
          ],
        ),
      ),
    );
  }
}
