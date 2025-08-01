import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:salon_sac/core/base_controller.dart';
import 'package:salon_sac/routers/app_pages.dart';
import 'package:salon_sac/services/api_services.dart';
import 'package:salon_sac/services/auth_service.dart';
import 'package:salon_sac/services/storage_service.dart';

class SplashController extends BaseController {
  @override
  void onReady() async {
    super.onReady();
    await waitForServices();
    await checkTokenAndRedirect();
  }

  Future<void> waitForServices() async {
    while (!Get.isRegistered<StorageService>() &&
        !Get.isRegistered<ApiServices>() &&
        !Get.isRegistered<AuthService>()) {
      await Future.delayed(Duration(seconds: 1));
    }
  }

  Future<void> checkTokenAndRedirect() async {
    Get.offAllNamed(AppRoutes.LOGIN);
  }
}
