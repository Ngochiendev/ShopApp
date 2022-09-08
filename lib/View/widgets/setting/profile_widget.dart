import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/View/widgets/text_ultils.dart';
import 'package:shopapp/logic/controller/auth_controller.dart';
import 'package:shopapp/logic/controller/setting_controller.dart';

class ProfileImage extends StatelessWidget {
  ProfileImage({super.key});
  final controller = Get.find<SettingController>();
  final authController = Get.find<Authcontroller>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () {
            return Row(
              children: [
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image:
                          NetworkImage(authController.displayUserPhoto.value),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUltils(
                      text: controller
                          .capitalize(authController.displayUserName.value),
                      fontsize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                    Text(
                      authController.displayEmail.value,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
