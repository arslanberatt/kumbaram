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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Obx(
                      () => ListView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        children: [
                          SummaryCard(
                            title: 'Aylık Gelir',
                            amount: controller.montlyIncome.value,
                            icon: Icons.arrow_upward,
                            color: AppColors.white,
                            gradientColors: [
                              AppColors.income.withOpacity(0.5),
                              AppColors.income.withOpacity(0.7),
                            ],
                          ),
                          SummaryCard(
                            title: 'Aylık Gelir',
                            amount: controller.montlyExpense.value,
                            icon: Icons.arrow_downward,
                            color: AppColors.white,
                            gradientColors: [
                              AppColors.expense.withOpacity(0.5),
                              AppColors.expense.withOpacity(0.7),
                            ],
                          ),
                          SummaryCard(
                            title: 'Aylık Bakiye',
                            amount:
                                (controller.montlyIncome.value -
                                controller.montlyExpense.value),
                            icon: Icons.account_balance_wallet,
                            color: AppColors.white,
                            gradientColors: [
                              AppColors.info.withOpacity(0.5),
                              AppColors.info.withOpacity(0.7),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(child: TransactionList(), flex: 10),
                ],
              ),
      ),
    );
  }
}
