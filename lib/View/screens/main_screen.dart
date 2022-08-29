import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shopapp/View/widgets/text_ultils.dart';
import 'package:shopapp/logic/controller/main_controller.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final controller = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          appBar: AppBar(
            title: TextUltils(
              text: controller.title[controller.currentIndex.value],
              fontsize: 22,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
            ),
            elevation: 0,
            backgroundColor: const Color.fromARGB(255, 107, 220, 111),
            centerTitle: true,
            leading: Container(),
            actions: [
              IconButton(
                onPressed: () {
                  print('cart');
                },
                icon: SvgPicture.asset(
                  './assets/icons/bag.svg',
                  fit: BoxFit.fill,
                  height: 30,
                ),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                ),
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                selectedIndex: controller.currentIndex.value,
                onTabChange: (index) {
                  controller.currentIndex.value = index;
                },
                haptic: true, // haptic feedback
                tabBorderRadius: 18,
                gap: 8,
                activeColor: Colors.white,
                iconSize: 22,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: const Color.fromARGB(255, 99, 174, 235),
                color: Colors.black,
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.category_outlined,
                    text: 'Category',
                  ),
                  GButton(
                    icon: Icons.favorite_outline,
                    text: 'Favorite',
                  ),
                  GButton(
                    icon: Icons.settings,
                    text: 'Setting',
                  ),
                ],
              ),
            ),
          ),
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: controller.tabs.value,
          ),
        );
      },
    );
  }
}
