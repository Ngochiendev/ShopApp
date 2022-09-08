import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/View/widgets/setting/language_widget.dart';
import 'package:shopapp/View/widgets/setting/logout_widget.dart';
import 'package:shopapp/View/widgets/setting/profile_widget.dart';
import 'package:shopapp/View/widgets/text_ultils.dart';
import 'package:shopapp/logic/controller/auth_controller.dart';

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
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          ProfileImage(),
          const SizedBox(height: 5),
          const Divider(color: Colors.grey, thickness: 1),
          const SizedBox(height: 20),
          TextUltils(
            text: 'GENERAL'.tr,
            fontsize: 18,
            fontWeight: FontWeight.w500,
            color: const Color.fromARGB(255, 107, 220, 111),
          ),
          const SizedBox(height: 20),
          //LanguageWidget
          SetLanguageWidget(),
          const SizedBox(height: 20),
          //LogoutWidget
          LogOutWidget(),
        ],
      ),
    );
  }
}
