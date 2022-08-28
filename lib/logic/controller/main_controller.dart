import 'package:get/get.dart';
import 'package:shopapp/View/screens/category_screen.dart';
import 'package:shopapp/View/screens/favorite_screen.dart';
import 'package:shopapp/View/screens/home_screen.dart';
import 'package:shopapp/View/screens/setting_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;
  final tabs = [
    const HomeScreen(),
    const CategoryScreen(),
    const FavoriteScreen(),
    const SettingScreen(),
  ].obs;
  final title = [
    "Stilven Shop",
    "Category",
    "Favorite",
    "Setting",
  ];
}
