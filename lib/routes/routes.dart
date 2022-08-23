import 'package:get/get.dart';
import '../View/screens/auth/login_screen.dart';
import '../View/screens/auth/signup_screen.dart';
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
      name: PageRoutes.loginScreen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: PageRoutes.signupScreen,
      page: () => SignUpScreen(),
    )
  ];
}

//initialRoute
class PageRoutes {
  static String flashScreen = '/flashScreen';
  static String loginScreen = '/loginScreen';
  static String signupScreen = '/signupScreen';
}
