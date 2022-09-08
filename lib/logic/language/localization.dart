import 'package:get/get.dart';
import 'package:shopapp/logic/language/en.dart';
import 'package:shopapp/logic/language/fr.dart';
import 'package:shopapp/ultils/ultilService.dart';

class LocalizationApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ene: en,
        frr: fr,
        // vii: vi,
      };
}
