import 'package:get/get.dart';
import 'package:salon_sac/services/api_services.dart';
import 'package:salon_sac/services/auth_service.dart';
import 'package:salon_sac/services/storage_service.dart';

class AppBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    await Get.putAsync<StorageService>(() async {
      final service = StorageService();
      await service.init();
      return service;
    });

    await Get.putAsync<ApiServices>(() async {
      final service = ApiServices();
      await service.init();
      return service;
    });

    await Get.putAsync<AuthService>(() async {
      final service = AuthService();
      await service.init();
      return service;
    });
  }
}
