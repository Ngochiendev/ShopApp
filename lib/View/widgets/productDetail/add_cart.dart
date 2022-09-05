// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shopapp/Models/product_models.dart';
import 'package:shopapp/View/widgets/text_ultils.dart';
import 'package:shopapp/logic/controller/cart_controller.dart';

class AddCart extends StatelessWidget {
  AddCart({
    Key? key,
    required this.price,
    required this.productModels,
  }) : super(key: key);
  final double price;
  final ProductModels productModels;
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextUltils(
                text: 'Price',
                fontsize: 20,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 128, 125, 125),
              ),
              SizedBox(width: 100, child: Text('\$ $price')),
            ],
          ),
          Expanded(
            child: SizedBox(
              height: 55,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 107, 220, 111),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    controller.addProductToCart(productModels);
                    print('add to cart');
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Add to Cart', style: TextStyle(fontSize: 20)),
                      SizedBox(width: 15),
                      Icon(Icons.shopping_cart),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
