import 'package:nb_utils/nb_utils.dart';
import 'package:get/get.dart';

Future<Map<String, Map<String, String>>> init() async {
  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  // Retrieving localized data
  Map<String, Map<String, String>> _languages = Map();

  return _languages;
}