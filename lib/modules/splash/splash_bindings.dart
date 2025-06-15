import 'package:get/instance_manager.dart';
import 'package:salon_sac/modules/splash/splash_controller.dart';

class SplashBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
