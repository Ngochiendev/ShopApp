import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  // var storage = GetStorage();
  // var langLocal = ene;
  String capitalize(String profileName) {
    return profileName.split("").map((name) => name.capitalize).join("");
  }

//   //Language
//   @override
//   void onInit() async {
//     super.onInit();
//     langLocal = await getLanguage;
//   }

//   //void saveLanguage
//   void saveLanguage(String lang) async {
//     storage.write("lang", lang).toString();
//   }

//   Future<String> get getLanguage async {
//     return storage.read("lang").toString();
//   }

//   void changeLanguage(String typeLanguage) {
//     saveLanguage(typeLanguage);
//     if (langLocal == typeLanguage) {
//       return;
//     }
//     if (typeLanguage == frr) {
//       langLocal = frr;
//       saveLanguage(frr);
//     } else {
//       langLocal = ene;
//       saveLanguage(ene);
//     }
//     update();
//   }
// }

  var currentTranslation = translations[0]['value'].obs;

// translation state
  void setTranslation({required String value}) {
    currentTranslation.value = value;
    switch (value) {
      case 'en_US':
        Get.updateLocale(const Locale('en', 'US'));
        break;
      case 'fr_FR':
        Get.updateLocale(const Locale('fr', 'FR'));
        break;
      case 'vi_VN':
        Get.updateLocale(const Locale('vi', 'VN'));
        break;
      default:
        break;
    }
  }
}

final List<Map<String, String>> translations = [
  {'title': 'English 🇬🇧', 'value': 'en_US'},
  {'title': 'France 🇫🇷', 'value': 'fr_FR'},
  {'title': 'Việt Nam 🇻🇳', 'value': 'vi_VN'},
];
