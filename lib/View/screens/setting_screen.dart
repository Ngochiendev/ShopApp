import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/logic/controller/auth_controller.dart';
import 'package:shopapp/ultils/theme.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<Authcontroller>();
    return Scaffold(
      body: Center(
        child: GetBuilder<Authcontroller>(
          builder: (_) {
            return IconButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: 'Logout From App',
                    titleStyle: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 130, 233, 195),
                    ),
                    middleText: 'Are you sure, you want to logout?',
                    middleTextStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 130, 233, 195),
                    ),
                    radius: 22,
                    textCancel: ' Cancel ',
                    cancelTextColor: const Color.fromARGB(255, 130, 233, 195),
                    onCancel: () {
                      Get.back();
                    },
                    textConfirm: ' Logout ',
                    confirmTextColor: Colors.white,
                    titlePadding: const EdgeInsets.symmetric(vertical: 15),
                    buttonColor: mainColor,
                    onConfirm: () {
                      controller.signOutFromApp();
                    },
                  );
                },
                icon: const Icon(Icons.logout_outlined));
          },
        ),
      ),
    );
  }
}
