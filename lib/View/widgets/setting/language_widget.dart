// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/View/widgets/text_ultils.dart';
import 'package:shopapp/logic/controller/setting_controller.dart';
import 'package:shopapp/ultils/theme.dart';

class SetLanguageWidget extends StatefulWidget {
  const SetLanguageWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SetLanguageWidget> createState() => _SetLanguageWidgetState();
}

class _SetLanguageWidgetState extends State<SetLanguageWidget> {
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
              child: DropdownButton<String?>(
                value: controller.currentTranslation.value,
                onChanged: (value) {
                  controller.setTranslation(value: value!);
                  Get.updateLocale(Locale(value));
                },
                // selectedItemBuilder: (context) => List.from(
                //   translations.map((e) => Text(e['title']!)),
                // ),
                items: List.from(
                  translations.map(
                    (e) => DropdownMenuItem<String?>(
                      onTap: () {
                        controller.setTranslation(value: e['value']!);
                      },
                      value: e['value'],
                      child: Text(e['title']!),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
