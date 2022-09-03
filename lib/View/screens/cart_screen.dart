import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/View/widgets/cart/empty_cart.dart';
import 'package:shopapp/logic/controller/cart_controller.dart';

import '../widgets/cart/cart_product_card.dart';
import '../widgets/cart/cart_total.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Obx(
      () {
        if (controller.productsMap.isEmpty) {
          return const EmptyCart();
        } else {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 107, 220, 111),
              title: const Text('Cart Items'),
              centerTitle: true,
              elevation: 0,
              actions: [
                IconButton(
                  onPressed: () {
                    controller.clearAllProduct();
                  },
                  icon: const Icon(Icons.backspace),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: SizedBox(
                height: size.height,
                width: size.width,
                child: Column(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return CartProductCard(
                              index: index,
                              quantity:
                                  controller.productsMap.values.toList()[index],
                              productModels:
                                  controller.productsMap.keys.toList()[index],
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 20),
                          itemCount: controller.productsMap.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: SizedBox(
              height: 100,
              child: CartTotal(),
            ),
          );
        }
      },
    );
  }
}
