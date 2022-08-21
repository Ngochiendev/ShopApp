import 'package:get/get.dart';
import 'package:shopapp/View/screens/main_screen.dart';
import '../View/screens/flash_screen.dart';

class AppPage {
  //initialRoute
  // static String wellcome = PageRoutes.wellcomeScreen;
  //getPages
  static final page = <GetPage>[
    GetPage(
      name: PageRoutes.flashScreen,
      page: () => const FlashScreen(),
    ),
    GetPage(
      name: PageRoutes.login,
      page: () => const login(),
    ),
  ];
}

//initialRoute
class PageRoutes {
  static String flashScreen = '/flashScreen';
  static String login = '/login';
}
