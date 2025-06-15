import 'package:get/instance_manager.dart';
import 'package:salon_sac/modules/login/login_controller.dart';
import 'package:salon_sac/services/auth_service.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
