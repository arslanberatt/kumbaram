import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_sac/modules/dashboard/dashboard_controller.dart';
import 'package:salon_sac/modules/dashboard/widgets/summary_card.dart';
import 'package:salon_sac/modules/dashboard/widgets/transaction_list.dart';
import 'package:salon_sac/themes/app_colors.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
              children: [
                Expanded(flex: 1, child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SummaryCard(
                      title: 'Aylık Gelir',
                      amount: controller.montlyIncome.value,
                      icon: Icons.arrow_upward,
                      color: AppColors.income, 
                      gradientColors: [
                        AppColors.income.withOpacity(0.25),
                        AppColors.income.withOpacity(0.5),
                      ],
                    ),
                    SummaryCard(
                      title: 'Aylık Gelir',
                      amount: controller.montlyExpense.value,
                      icon: Icons.arrow_upward,
                      color: AppColors.expense, 
                      gradientColors: [
                        AppColors.expense.withOpacity(0.25),
                        AppColors.expense.withOpacity(0.5),
                      ],
                    ),
                  ],
                 
                )),
                Expanded(
                child: TransactionList(),
                flex: 8,
                ),
                ],
            ),
      ),
    );
  }
}
