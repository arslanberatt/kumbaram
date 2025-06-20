import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_sac/modules/transaction/controllers/category_controller.dart';
import 'package:salon_sac/utils/icon_helper.dart';

class AddCategoryDialog extends StatelessWidget {
  const AddCategoryDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<CategoryController>(CategoryController());
    return AlertDialog(
      title: Text(
        'Kategori Ekle',
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
      ),
      content: Form(
        key: controller.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Kategori Adı',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => controller.categoryName.value = value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Kategori adı boş olamaz';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            Obx(
              () => DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Kategori İkonu',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kategori ikonu seçilmelidir';
                  }
                  return null;
                },
                items: icons
                    .map(
                      (icon) => DropdownMenuItem<String>(
                        value: icon,
                        child: Row(
                          children: [
                            Icon(
                              getCategoryIcon(
                                iconName: icon,
                                isSystem: true,
                                type: controller.categoryType.value,
                              ),
                              size: 24,
                            ),
                            SizedBox(width: 8),
                            Text(icon),
                          ],
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    controller.selectedIcon.value = value;
                  }
                },
                value: controller.selectedIcon.value,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () => Get.back(), child: Text('iptal')),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () async {
                    if (!controller.isLoading) {
                      await controller.createCategory();
                      Get.back(result: controller.categoryName.value);
                    }
                  },
                  child: Text('Kaydet'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
