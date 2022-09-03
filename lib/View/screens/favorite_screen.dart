import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shopapp/View/widgets/text_ultils.dart';
import 'package:shopapp/logic/controller/product_controller.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (controller.favoriteList.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 300,
                    width: 400,
                    child: Lottie.asset(
                      './assets/image_json/favorite-button.json',
                      filterQuality: FilterQuality.low,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const Text('Please! Add your favorites products',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                ],
              ),
            );
          } else {
            return ListView.separated(
              itemBuilder: (context, index) {
                return FavItem(
                  image: controller.favoriteList[index].image,
                  title: controller.favoriteList[index].title,
                  price: controller.favoriteList[index].price,
                  productId: controller.favoriteList[index].id,
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.grey,
                  thickness: 1,
                );
              },
              itemCount: controller.favoriteList.length,
            );
          }
        },
      ),
    );
  }

  Widget FavItem({
    required String image,
    required String title,
    required double price,
    required int productId,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 100,
        width: double.infinity,
        child: Row(
          children: [
            SizedBox(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    image,
                    fit: BoxFit.fill,
                  ),
                ), //sized card
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextUltils(
                    text: title,
                    fontsize: 18,
                    fontWeight: FontWeight.w400,
                    textOverflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ),
                  TextUltils(
                    text: '\$ $price',
                    fontsize: 15,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                controller.manageFavorite(productId);
                print('favorite');
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
