import 'package:admin_app/features/splash/domain/repositories/splash_repository_interface.dart';
import 'package:admin_app/features/splash/domain/services/splash_service_interface.dart';

class SplashService implements SplashServiceInterface {
  final SplashRepositoryInterface splashRepositoryInterface;

  SplashService({required this.splashRepositoryInterface});

  @override
  void initSharedData() {
    splashRepositoryInterface.initSharedData();
  }
}
