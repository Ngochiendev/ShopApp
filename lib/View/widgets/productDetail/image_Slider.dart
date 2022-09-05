// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: 5,
          itemBuilder: (context, index, realindex) {
            return Container(
              margin: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
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
          bottom: 10,
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
      ],
    );
  }
}
