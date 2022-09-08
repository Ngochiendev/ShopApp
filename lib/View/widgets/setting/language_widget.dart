// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shopapp/View/widgets/text_ultils.dart';
import 'package:shopapp/logic/controller/setting_controller.dart';
import 'package:shopapp/ultils/theme.dart';
import 'package:shopapp/ultils/ultilService.dart';

class SetLanguageWidget extends StatelessWidget {
  SetLanguageWidget({
    Key? key,
  }) : super(key: key);
  final controller = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(builder: (_) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Material(
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: languageSettings),
                  child: const Icon(
                    Icons.language,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 15),
                TextUltils(
                  text: 'Language'.tr,
                  fontsize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
          Container(
            height: 45,
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.black54,
                width: 1,
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                  items: [
                    DropdownMenuItem(
                      value: ene,
                      child: Text(
                        english,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                    DropdownMenuItem(
                      value: frr,
                      child: Text(
                        france,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                  ],
                  icon: const Icon(
                    Icons.arrow_drop_down,
                  ),
                  value: ene,
                  onChanged: (value) {
                    controller.changeLanguage(value!);
                    Get.updateLocale(Locale(value));
                  }),
            ),
          ),
        ],
      );
    });
  }
}
