import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/View/widgets/text_ultils.dart';
import 'package:shopapp/logic/controller/auth_controller.dart';
import 'package:shopapp/ultils/theme.dart';

class LogOutWidget extends StatelessWidget {
  LogOutWidget({super.key});
  final controller = Get.find<Authcontroller>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Authcontroller>(
      builder: (_) => Material(
        child: InkWell(
          onTap: () {
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
            print('logout');
          },
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: logOutSettings),
                child: const Icon(
                  Icons.logout_outlined,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 15),
              TextUltils(
                text: 'Logout'.tr,
                fontsize: 20,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
