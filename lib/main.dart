import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopapp/logic/language/localization.dart';
import 'package:shopapp/routes/routes.dart';
import 'package:shopapp/ultils/ultilService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Shop App',
      locale: Locale(GetStorage().read<String>("lang").toString()),
      translations: LocalizationApp(),
      fallbackLocale: Locale(ene),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: FirebaseAuth.instance.currentUser != null ||
              GetStorage().read<bool>('auth') == true
          ? PageRoutes.mainScreen
          : PageRoutes.flashScreen,
      getPages: AppPage.page,
    );
  }
}
