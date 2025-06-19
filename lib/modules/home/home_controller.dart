import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:salon_sac/core/base_controller.dart';
import 'package:salon_sac/routers/app_pages.dart';
import 'package:salon_sac/services/auth_service.dart';

class HomeController extends BaseController {
  cikisYap() async {
    await Get.find<AuthService>().signOut();
    Get.offAllNamed(AppRoutes.LOGIN);
  }
}
