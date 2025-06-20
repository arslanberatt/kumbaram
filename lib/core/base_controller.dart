import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_sac/themes/app_colors.dart';

class BaseController extends GetxController {
  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  void setLoading(bool value) => _isLoading.value = value;

  void showErrorSnackbar({
    required String message,
    String title = 'Hata',
    Duration duration = const Duration(seconds: 3),
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Get.isDarkMode
          ? AppColors.primaryLight
          : AppColors.primaryDark,
      colorText: Get.isDarkMode ? AppColors.white : AppColors.black,
      margin: EdgeInsets.all(16),
      borderRadius: 8,
      isDismissible: true,
      duration: duration,
      icon: const Icon(Icons.check_circle_outline, color: Colors.white),
      overlayBlur: 0.5,
      overlayColor: Colors.black12,
    );
  }

  void showSuccessSnackbar({
    required String message,
    String title = 'Başarılı',
    Duration duration = const Duration(seconds: 3),
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Get.isDarkMode
          ? AppColors
                .info // örn: koyu yeşil
          : AppColors.info, // örn: açık yeşil
      colorText: Get.isDarkMode ? AppColors.white : AppColors.black,
      margin: const EdgeInsets.all(16),
      borderRadius: 8,
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
      duration: duration,
      icon: const Icon(Icons.check_circle_outline, color: Colors.white),
      overlayBlur: 0.5,
      overlayColor: Colors.black12,
    );
  }
}
