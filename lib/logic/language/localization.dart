import 'package:get/get.dart';

class LocalizationApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en_US": {
          "GENERAL": "GENERAL",
          "Language": "Language",
          "Logout": "Logout"
        },
        "fr_FR": {
          "GENERAL": "GÉNÉRAL",
          "Dark Mode": "Mode sombre",
          "Language": "Langue",
          "Logout": "Se déconnecter"
        },
        "vi_VN": {
          "GENERAL": "GENERAL",
          "Language": "Ngôn Ngữ",
          "Logout": "Đăng Xuất",
        },
      };
}
