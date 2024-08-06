import 'package:admin_app/features/splash/domain/repositories/splash_repository_interface.dart';
import 'package:admin_app/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashRepository implements SplashRepositoryInterface {
  final SharedPreferences sharedPreferences;

  SplashRepository({required this.sharedPreferences});

  @override
  void initSharedData() async {
    if (!sharedPreferences.containsKey(AppConstants.theme)) {
      sharedPreferences.setBool(AppConstants.theme, false);
    }
  }
}
