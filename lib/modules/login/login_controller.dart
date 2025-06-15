import 'package:get/get.dart';
import 'package:salon_sac/core/base_controller.dart';
import 'package:salon_sac/services/auth_service.dart';

class LoginController extends BaseController {
  late final AuthService _authService;

  @override
  void onInit() {
    super.onInit();
    _authService = Get.find<AuthService>();
  }

  loginWithGoogle() async {
    await _authService.loginGoogleService();
  }
}
