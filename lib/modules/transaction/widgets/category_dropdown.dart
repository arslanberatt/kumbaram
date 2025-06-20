import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:salon_sac/modules/transaction/transaction_controller.dart';
import 'package:salon_sac/utils/icon_helper.dart';

class CategoryDropdown extends GetView<TransactionController> {
  const CategoryDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButtonFormField(
        decoration: InputDecoration(labelText: 'Kategori'),
        value: controller.selectedCategoryId.value.isEmpty
            ? null
            : controller.selectedCategoryId.value,
        items: controller.categories
            .where((cat) => cat.type == controller.transactionType.value)
            .map(
              (category) => DropdownMenuItem(
                value: category.id,
                child: Row(
                  children: [
                    Icon(
                      getCategoryIcon(
                        iconName: category.icon!,
                        isSystem: category.isSystem!,
                        type: category.type!,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(category.name!),
                  ],
                ),
              ),
            )
            .toList(),
        onChanged: (value) {
          controller.selectedCategoryId.value = value!;
        },
      ),
    );
  }
}
