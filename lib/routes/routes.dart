import 'package:get/get.dart';
import 'package:shopapp/View/screens/auth/forgot_screen.dart';
import 'package:shopapp/View/screens/auth/signin_signupScreen.dart';
import 'package:shopapp/View/screens/main_screen.dart';
import 'package:shopapp/logic/bindings/Auth_binding.dart';
import 'package:shopapp/logic/bindings/Main_binding.dart';
import '../View/screens/auth/login_screen.dart';
import '../View/screens/auth/signup_screen.dart';
import '../View/screens/auth/flash_screen.dart';

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
      name: PageRoutes.signin_signupScreen,
      page: () => const Signin_SignupScreen(),
    ),
    GetPage(
      name: PageRoutes.loginScreen,
      page: () => const LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: PageRoutes.signupScreen,
      page: () => const SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: PageRoutes.forgetScreen,
      page: () => const ForgotScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: PageRoutes.mainScreen,
      page: () => const MainScreen(),
      bindings: [
        AuthBinding(),
        MainBinding(),
      ],
    ),
  ];
}

//initialRoute
class PageRoutes {
  static String flashScreen = '/flashScreen';
  static String signin_signupScreen = '/signin_signupScreen';
  static String loginScreen = '/loginScreen';
  static String signupScreen = '/signupScreen';
  static String forgetScreen = '/forgotScreen';
  static String mainScreen = '/mainScreen';
}
