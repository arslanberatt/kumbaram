import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:salon_sac/modules/transaction/transaction_controller.dart';
import 'package:salon_sac/modules/transaction/widgets/ammount_input.dart';
import 'package:salon_sac/modules/transaction/widgets/category_dropdown.dart';
import 'package:salon_sac/modules/transaction/widgets/date_input.dart';
import 'package:salon_sac/modules/transaction/widgets/description_input.dart';
import 'package:salon_sac/modules/transaction/widgets/save_button.dart';
import 'package:salon_sac/modules/transaction/widgets/transaction_type_selector.dart';
import 'package:salon_sac/themes/app_colors.dart';

class TransactionPage extends GetView<TransactionController> {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kasa'), backgroundColor: AppColors.info),
      body: Obx(
        () => controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      TransactionTypeSelector(),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(child: CategoryDropdown()),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add_circle_outline),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      AmmountInput(),
                      SizedBox(height: 16),
                      DescriptionInput(),
                      SizedBox(height: 16),
                      DateInput(),
                      SizedBox(height: 16),
                      SaveButton(),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
