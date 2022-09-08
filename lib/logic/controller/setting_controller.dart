import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopapp/ultils/ultilService.dart';

class SettingController extends GetxController {
  var storage = GetStorage();
  String langLocal = ene;
  String capitalize(String profileName) {
    return profileName.split("").map((name) => name.capitalize).join("");
  }
  
  //Language
  @override
  void onInit() async {
    super.onInit();
    langLocal = await getLanguage;
  }

  //void saveLanguage
  void saveLanguage(String lang) async {
    storage.write("lang", lang).toString();
  }

  Future<String> get getLanguage async {
    return storage.read("lang").toString();
  }

  void changeLanguage(String typeLanguage) {
    saveLanguage(typeLanguage);
    if (langLocal == typeLanguage) {
      return;
    }
    if (typeLanguage == frr) {
      langLocal = frr;
      saveLanguage(frr);
    } else {
      langLocal = ene;
      saveLanguage(ene);
    }
    update();
  }
}
