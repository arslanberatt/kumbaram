import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:salon_sac/services/api_services.dart';
import 'package:salon_sac/services/storage_service.dart';

class AuthService extends GetxService {
  late final StorageService _storageService;
  late final ApiServices _apiServices;
  late final GoogleSignIn _googleSignIn;

  Future<AuthService> init() async {
    _storageService = Get.find<StorageService>();
    _apiServices = Get.find<ApiServices>();
    _googleSignIn = GoogleSignIn();
    return this;
  }

  loginGoogleService() async {
    try {
      await _googleSignIn.signOut();
      final GoogleSignInAccount? _googleUser = await _googleSignIn.signIn();
      if (_googleUser == null) return null;
      final GoogleSignInAuthentication _googleAuthentication =
          await _googleUser.authentication;

      print("google user: ${_googleUser.toString()}");
      print("google auth: ${_googleAuthentication.idToken}");
    } catch (e) {
      print(e);
    }
  }
}
