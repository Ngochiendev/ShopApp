// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shopapp/Models/product_models.dart';
import 'package:shopapp/View/screens/product_details_screen.dart';
import 'package:shopapp/View/widgets/text_ultils.dart';
import 'package:shopapp/logic/controller/cart_controller.dart';
import 'package:shopapp/logic/controller/category_controller.dart';
import 'package:shopapp/logic/controller/product_controller.dart';

class CategoryItems extends StatelessWidget {
  CategoryItems({
    Key? key,
    required this.categoryTitle,
  }) : super(key: key);
  final controller = Get.find<ProductController>();
  final cartController = Get.find<CartController>();
  final categoryController = Get.find<CategoryController>();
  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 107, 220, 111),
        title: TextUltils(
          text: categoryTitle,
          fontsize: 22,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.8,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Obx(
        () {
          if (categoryController.isCategoryLoading.value) {
            return const Center(
              child: SizedBox(
                height: 30.0,
                width: 30.0,
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              ),
            );
          } else {
            return GridView.builder(
              itemCount: categoryController.categoryList.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 0.8,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                maxCrossAxisExtent: 200,
                mainAxisExtent: 215,
              ),
              itemBuilder: (context, index) {
                return buidCartItem(
                  image: categoryController.categoryList[index].image,
                  price: categoryController.categoryList[index].price,
                  rate: categoryController.categoryList[index].rating.rate,
                  productId: categoryController.categoryList[index].id,
                  productModels: categoryController.categoryList[index],
                  onTap: () {
                    Get.to(() => ProductDetailsScreen(
                        productModels: categoryController.categoryList[index]));
                    print('Product Details Screen');
                  },
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget buidCartItem({
    required String image,
    required double? rate,
    required double? price,
    required int productId,
    required ProductModels productModels,
    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 240, 237, 237),
                spreadRadius: 3,
                blurRadius: 2,
              ),
            ],
          ),
          child: Column(
            children: [
              GetX<ProductController>(
                initState: (_) {},
                builder: (_) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          controller.manageFavorite(productId);
                          print('love');
                        },
                        icon: controller.isFavorites(productId)
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.favorite_outline,
                                color: Colors.black,
                              ),
                      ),
                      IconButton(
                        onPressed: () {
                          cartController.addProductToCart(productModels);
                          print('add to cart');
                        },
                        icon: const Icon(
                          Icons.shopping_cart,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  );
                },
              ),
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$ $price'),
                    Container(
                      height: 18,
                      width: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 120, 214, 123)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextUltils(
                            text: '$rate',
                            fontsize: 13,
                            color: Colors.white,
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 13,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
