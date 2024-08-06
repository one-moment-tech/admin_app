import 'package:admin_app/features/splash/domain/services/splash_service_interface.dart';
import 'package:get/get.dart';

class SplashController extends GetxController implements GetxService {
  final SplashServiceInterface splashServiceInterface;

  SplashController({required this.splashServiceInterface});

  Future<void> initSharedData() async {
    splashServiceInterface.initSharedData();
  }
}
