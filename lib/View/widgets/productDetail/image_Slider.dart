// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shopapp/View/widgets/productDetail/color_picker.dart';
import 'package:shopapp/logic/controller/cart_controller.dart';
import 'package:shopapp/ultils/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);
  final String imageUrl;

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  CarouselController buttonCarouselController = CarouselController();
  int currentPage = 0;
  int currentColor = 0;
  final quantitycontroller = Get.find<CartController>();

  final List<Color> colorSelected = [
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4,
    kCOlor5
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: 5,
          itemBuilder: (context, index, realindex) {
            return Container(
              margin: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
                image: DecorationImage(
                  image: NetworkImage(
                    widget.imageUrl,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            );
          },
          carouselController: buttonCarouselController,
          options: CarouselOptions(
              height: 400,
              autoPlay: true,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              autoPlayAnimationDuration: const Duration(seconds: 2),
              onPageChanged: (index, reson) {
                setState(() {
                  currentPage = index;
                });
              }),
        ),
        Positioned(
          bottom: 0,
          left: 130,
          child: AnimatedSmoothIndicator(
            activeIndex: currentPage,
            count: 5,
            effect: const ExpandingDotsEffect(
              dotHeight: 10,
              dotWidth: 10,
              activeDotColor: Colors.green,
            ),
          ),
        ),
        Positioned(
          right: 10,
          bottom: 70,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(30),
            ),
            height: 200,
            width: 50,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentColor = index;
                      });
                    },
                    child: ColorPicker(
                        color: colorSelected[index],
                        outerBoder: currentColor == index),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 3,
                  );
                },
                itemCount: colorSelected.length,
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                  print('back');
                },
                child: Container(
                  height: 50,
                  width: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 110, 227, 114),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
              Obx(() => Container(
                    height: 50,
                    width: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 110, 227, 114),
                    ),
                    child: Badge(
                      position: BadgePosition.topEnd(top: -2, end: -4),
                      animationDuration: const Duration(milliseconds: 300),
                      animationType: BadgeAnimationType.slide,
                      badgeContent: Text(
                        quantitycontroller.quantity().toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 10),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Get.toNamed('cartScreen');
                          print('cart');
                        },
                        icon: SvgPicture.asset(
                          './assets/icons/bag.svg',
                          fit: BoxFit.fill,
                          height: 30,
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
