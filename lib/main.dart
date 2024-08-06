import 'package:admin_app/controller/theme_controller.dart';
import 'package:admin_app/helper/route_helper.dart';
import 'package:admin_app/theme/dark_theme.dart';
import 'package:admin_app/theme/light_theme.dart';
import 'package:admin_app/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'helper/get_di.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (themeController) {
      return GetMaterialApp(
        title: AppConstants.appName,
        debugShowCheckedModeBanner: false,
        navigatorKey: Get.key,
        theme: themeController.darkTheme ? dark : light,
        initialRoute: RouteHelper.getSplashRoute(),
        getPages: RouteHelper.routes,
        defaultTransition: Transition.topLevel,
        transitionDuration: const Duration(milliseconds: 500),
      );
    });
  }
}
