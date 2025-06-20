import 'package:get/instance_manager.dart';
import 'package:salon_sac/modules/home/home_controller.dart';
import 'package:salon_sac/modules/profile/profile_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(()=> HomeController());
    Get.lazyPut<ProfileController>(()=> ProfileController());
  }
}
