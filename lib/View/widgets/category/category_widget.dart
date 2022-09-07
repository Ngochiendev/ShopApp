// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/View/widgets/category/category_items.dart';
import 'package:shopapp/logic/controller/category_controller.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({
    Key? key,
  }) : super(key: key);
  final controller = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isCategoryLoading.value) {
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
          child: ListView.separated(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  controller.getCategoryIndex(index);
                  Get.to(
                    () => CategoryItems(
                      categoryTitle: controller.categoryNameList[index],
                    ),
                  );
                  print('object');
                },
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(controller.imageCategory[index]),
                      fit: BoxFit.fill,
                    ),
                    color: Colors.blue,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 10),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        controller.categoryNameList[index],
                        style: const TextStyle(
                          backgroundColor: Colors.black12,
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 15);
            },
            itemCount: controller.categoryNameList.length,
          ),
        );
      }
    });
  }
}
