// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:shopapp/View/widgets/text_ultils.dart';
import 'package:shopapp/logic/controller/product_controller.dart';

class ClothesInfo extends StatelessWidget {
  ClothesInfo({
    Key? key,
    required this.title,
    required this.productID,
    required this.rating,
    required this.decriptions,
  }) : super(key: key);
  final String title;
  final int productID;
  final double rating;
  final String decriptions;
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    overflow: TextOverflow.fade,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Obx(
                () => Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    onTap: () {
                      controller.manageFavorite(productID);
                    },
                    child: controller.isFavorites(productID)
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 20,
                          )
                        : const Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.black,
                            size: 20,
                          ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextUltils(
                textAlign: TextAlign.center,
                text: '$rating',
                fontsize: 18,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(width: 10),
              RatingBarIndicator(
                rating: rating,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 24,
                direction: Axis.horizontal,
              ),
            ],
          ),
          const SizedBox(height: 20),
          ReadMoreText(
            decriptions,
            textAlign: TextAlign.justify,
            trimLines: 4,
            trimMode: TrimMode.Line,
            trimCollapsedText: ' Show more',
            trimExpandedText: ' Show less',
            moreStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.greenAccent),
            lessStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.greenAccent),
          ),
        ],
      ),
    );
  }
}
