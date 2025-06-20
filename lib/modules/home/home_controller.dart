import 'package:get/get.dart';
import 'package:salon_sac/core/base_controller.dart';
import 'package:salon_sac/routers/app_pages.dart';
import 'package:salon_sac/services/auth_service.dart';

class HomeController extends BaseController {
  final currentIndex = 0.obs;
  changePage(int index) {
    currentIndex.value = index;
  }

  cikisYap() async {
    await Get.find<AuthService>().signOut();
    Get.offAllNamed(AppRoutes.LOGIN);
  }

  void goToTransaction() {
    Get.toNamed(AppRoutes.TRANSACTION);
  }
}
