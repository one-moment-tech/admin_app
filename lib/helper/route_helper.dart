import 'package:admin_app/features/home/screen/home_screen.dart';
import 'package:admin_app/features/splash/screens/splash_screen.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';

  static String getInitialRoute() => initial;
  static String getSplashRoute() => splash;

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const HomeScreen()),
    GetPage(name: splash, page: () {
      return SplashScreen();
    }),
  ];
}