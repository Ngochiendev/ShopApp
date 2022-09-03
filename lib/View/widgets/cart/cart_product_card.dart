// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/Models/product_models.dart';
import 'package:shopapp/logic/controller/cart_controller.dart';

class CartProductCard extends StatelessWidget {
  CartProductCard({
    Key? key,
    required this.productModels,
    required this.index,
    required this.quantity,
  }) : super(key: key);

  final ProductModels productModels;
  final int index;
  final int quantity;
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      height: 120,
      width: 100,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 149, 222, 151).withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
            height: 120,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(productModels.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModels.title,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis),
                ),
                const SizedBox(height: 10),
                Text(
                  '\$ ${controller.productSubTotal[index].toStringAsFixed(2)}',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      controller.removeProductToCart(productModels);
                    },
                    icon: const Icon(
                      Icons.remove_circle,
                      size: 24,
                    ),
                  ),
                  Text('$quantity'),
                  IconButton(
                    onPressed: () {
                      controller.addProductToCart(productModels);
                    },
                    icon: const Icon(
                      Icons.add_circle,
                      size: 24,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  controller.removeOneProduct(productModels);
                },
                icon: const Icon(
                  Icons.delete,
                  size: 22,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
