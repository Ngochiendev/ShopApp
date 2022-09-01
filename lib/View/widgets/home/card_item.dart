import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/View/widgets/text_ultils.dart';
import 'package:shopapp/logic/controller/product_controller.dart';

class CardItems extends StatelessWidget {
  CardItems({Key? key}) : super(key: key);
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isLoading.value) {
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
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: GridView.builder(
                itemCount: controller.productsList.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  maxCrossAxisExtent: 200,
                  mainAxisExtent: 215,
                ),
                itemBuilder: (context, index) {
                  return buidCartItem(
                    image: controller.productsList[index].image,
                    price: controller.productsList[index].price,
                    rate: controller.productsList[index].rating.rate,
                    productId: controller.productsList[index].id,
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }

  Widget buidCartItem({
    required String image,
    required double? rate,
    required double? price,
    required int productId,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                        print('add');
                      },
                      icon: const Icon(
                        Icons.add,
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
    );
  }
}
