
import 'package:admin_app/api/api_client.dart';
import 'package:admin_app/features/splash/controllers/splash_controller.dart';
import 'package:admin_app/controller/theme_controller.dart';
import 'package:admin_app/features/splash/domain/repositories/splash_repository.dart';
import 'package:admin_app/features/splash/domain/repositories/splash_repository_interface.dart';
import 'package:admin_app/features/splash/domain/services/splash_service.dart';
import 'package:admin_app/features/splash/domain/services/splash_service_interface.dart';
import 'package:admin_app/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

init() async {
  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  /// Repository interface
  SplashRepositoryInterface splashRepositoryInterface = SplashRepository(sharedPreferences: Get.find());
  Get.lazyPut(() => splashRepositoryInterface);
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUrl, sharedPreferences: Get.find()));

  /// Service Interface
  SplashServiceInterface splashServiceInterface = SplashService(splashRepositoryInterface: Get.find());
  Get.lazyPut(() => splashServiceInterface);

  // Controller
  Get.lazyPut(() => ThemeController(sharedPreferences: Get.find()));
  Get.lazyPut(() => SplashController(splashServiceInterface: Get.find()));

}