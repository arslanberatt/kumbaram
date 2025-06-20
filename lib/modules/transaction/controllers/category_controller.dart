import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_sac/core/base_controller.dart';
import 'package:salon_sac/models/app_category.dart';
import 'package:salon_sac/modules/transaction/controllers/transaction_controller.dart';
import 'package:salon_sac/repositories/category_repository.dart';
import 'package:salon_sac/utils/icon_helper.dart';

class CategoryController extends BaseController {
  final categoryName = ''.obs;
  final selectedIcon = ''.obs;
  final formKey = GlobalKey<FormState>();
  final categoryType = ''.obs;

  late final CategoryRepository categoryRepository;

  @override
  void onInit() {
    super.onInit();
    categoryRepository = Get.find<CategoryRepository>();
    categoryType.value =
        Get.find<TransactionController>().transactionType.value;
    selectedIcon.value = icons.first;
  }

  Future<void> createCategory() async {
    try {
      if (!formKey.currentState!.validate()) return;
      setLoading(true);
      var newCategory = AppCategory(
        name: categoryName.value,
        icon: selectedIcon.value,
        type: categoryType.value,
      );
      var addedCategory = await categoryRepository.createCategory(newCategory);
      Get.back(result: newCategory);
    } catch (e) {
      showErrorSnackbar(message: 'Kategori oluşturulurken bir hata oluştu');
    } finally {
      setLoading(false);
    }
  }
}
