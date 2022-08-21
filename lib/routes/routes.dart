import 'package:get/get.dart';
import '../View/screens/wellcome_screen.dart';

class AppPage {
  //initialRoute
  // static String wellcome = PageRoutes.wellcomeScreen;
  //getPages
  static final page = <GetPage>[
    GetPage(
      name: PageRoutes.wellcomeScreen,
      page: () => const WellComeScreen(),
    ),
  ];
}

//initialRoute
class PageRoutes {
  static String wellcomeScreen = '/wellcomeScreen';
}
