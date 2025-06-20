import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_sac/core/base_controller.dart';
import 'package:salon_sac/models/app_category.dart';
import 'package:salon_sac/repositories/category_repository.dart';
import 'package:salon_sac/repositories/transaction_repository.dart';

class TransactionController extends BaseController {
  final CategoryRepository _categoryRepository = Get.find<CategoryRepository>();
  final TransactionRepository _transactionRepository =
      Get.find<TransactionRepository>();

  final categories = <AppCategory>[].obs;
  final selectedCategoryId = ''.obs;
  final transactionType = 'expense'.obs;
  final formKey = GlobalKey<FormState>();
  final amount = 0.0.obs;
  final description = ''.obs;
  final date = DateTime.now().obs;

  @override
  void onInit() {
    super.onInit();
    loadCategories();

    ever(transactionType, (callback) {
      final filteredCategories = categories
          .where((category) => category.type == transactionType.value)
          .toList();
      if (filteredCategories.isNotEmpty) {
        selectedCategoryId.value = filteredCategories.first.id!;
      } else {
        selectedCategoryId.value = '';
      }
    });
  }

  Future<void> createTransaction() async {}

  Future<void> loadCategories() async {
    setLoading(true);
    try {
      final result = await _categoryRepository.getCategories();
      categories.value = result;
      getFirstCategory();
    } catch (e) {
      showErrorSnackbar(message: 'Kategoriler getirilirken hata oluştu');
    } finally {
      setLoading(false);
    }
  }

  void getFirstCategory() {
    final filteredCategories = categories
        .where((category) => category.type == transactionType.value)
        .toList();
    if (filteredCategories.isNotEmpty) {
      selectedCategoryId.value = filteredCategories.first.id!;
    } else {
      selectedCategoryId.value = '';
    }
  }
}
