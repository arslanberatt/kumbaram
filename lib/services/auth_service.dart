import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:salon_sac/models/app_user.dart';
import 'package:salon_sac/services/api_services.dart';
import 'package:salon_sac/services/storage_service.dart';

class AuthService extends GetxService {
  late final StorageService _storageService;
  late final ApiServices _apiServices;
  late final GoogleSignIn _googleSignIn;

  final Rx<AppUser?> currentUser = Rx<AppUser?>(null);

  Future<AuthService> init() async {
    _storageService = Get.find<StorageService>();
    _apiServices = Get.find<ApiServices>();
    _googleSignIn = GoogleSignIn(serverClientId : ApiConstants.serverClientId);
    return this;
  }

  Future<AppUser?> loginGoogleService() async {
    try {
      await _googleSignIn.signOut();
      final GoogleSignInAccount? _googleUser = await _googleSignIn.signIn();
      if (_googleUser == null) return null;
      final GoogleSignInAuthentication _googleAuthentication =
          await _googleUser.authentication;
      print("google user: ${_googleUser.toString()}");
      final response = await _apiServices.post(
        ApiConstants.login,
        data: {'idToken': _googleAuthentication.idToken},
      );
      if (response.statusCode == 200) {
        await _storageService.setValue<String>(
          StorageKeys.userToken,
          response.data['token'],
        );
        print('JWT TOKEN');
        print(response.data['token']);
        print('JWT TOKEN');
        var user = AppUser.fromJson(response.data['user']);
        currentUser.value = user;
        return user;
      } else {
        return null;
      }
    } catch (e) {
      currentUser.value = null;
      print(e);
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _storageService.remove(StorageKeys.userToken);
      currentUser.value = null;
    } catch (e) {
      print('Çıkış yapılırken hata');
    }
  }

  Future<AppUser?> getProfile() async {
    try {
      final response = await _apiServices.get(ApiConstants.profile);
      if (response.statusCode == 200) {
        currentUser.value = AppUser.fromJson(response.data);
        return AppUser.fromJson(response.data);
      }
      return null;
    } catch (e) {
      print('Kullanıcı bilgileri getirilirken hata');
      return null;
    }
  }

  Future<bool> isAuthenticated() async {
    try {
      final token = await _storageService.getValue<String>(
        StorageKeys.userToken,
      );
      if (token == null) {
        currentUser.value = null;
        return false;
      }
      final user = await getProfile();
      if (user != null) {
        currentUser.value = user;
        return true;
      } else {
        await _storageService.remove(StorageKeys.userToken);
        currentUser.value = null;
        return false;
      }
    } catch (e) {
      await _storageService.remove(StorageKeys.userToken);
      currentUser.value = null;
      return false;
    }
  }
}
