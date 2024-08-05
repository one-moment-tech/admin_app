
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

}