import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:salon_sac/modules/dashboard/dashboard_controller.dart';
import 'package:salon_sac/themes/app_colors.dart';
import 'package:salon_sac/utils/icon_helper.dart';

class TransactionList extends GetView<DashboardController> {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.myTransaction.isEmpty) {
        return Center(child: Text('Henüz bir işlem yok'));
      }
      return Card(
        child: ListView.separated(
          itemBuilder: (context, index) {
            var theTransaction = controller.myTransaction[index];
            var category = theTransaction.category;
            return Dismissible(
              key: ValueKey(theTransaction.id),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                controller.deleteTransaction(theTransaction.id!);
              },
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.delete, color: Colors.white),
              ),
              child: ListTile(
                leading: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: theTransaction.type == 'income'
                        ? (Theme.of(context).brightness == Brightness.dark)
                              ? AppColors.darkIncome.withOpacity(0.1)
                              : AppColors.income.withOpacity(0.25)
                        : (Theme.of(context).brightness == Brightness.dark)
                        ? AppColors.darkExpense.withOpacity(0.1)
                        : AppColors.expense.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    getCategoryIcon(
                      iconName: category!.icon!,
                      isSystem: true,
                      type: category.type!,
                    ),
                    color: theTransaction.type == 'income'
                        ? (Theme.of(context).brightness == Brightness.dark)
                              ? AppColors.darkIncome
                              : AppColors.income
                        : (Theme.of(context).brightness == Brightness.dark)
                        ? AppColors.expense
                        : AppColors.darkExpense,
                  ),
                ),
                title: Text(category.name ?? "Kategori Yok"),
                subtitle: Text(theTransaction.description ?? "Açıklama yok"),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${theTransaction.type == 'income' ? '+' : '-'}'
                      '${NumberFormat.currency(
                        symbol: '₺',
                        decimalDigits: 2,
                        locale: 'tr_TR', // İsteğe bağlı: Türkçe sayı formatı için
                      ).format(double.parse(theTransaction.amount!))}',
                      style: TextStyle(
                        fontSize: 14,
                        color: theTransaction.type == 'income'
                            ? (Theme.of(context).brightness == Brightness.dark)
                                  ? AppColors.darkIncome
                                  : AppColors.income
                            : (Theme.of(context).brightness == Brightness.dark)
                            ? AppColors.expense
                            : AppColors.darkExpense,
                      ),
                    ),
                    Text(DateFormat('dd MMMM y').format(theTransaction.date!),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.grey
                          : AppColors.black,
                    )
                    ,)
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(height: 1);
          },
          itemCount: controller.myTransaction.length,
        ),
      );
    });
  }
}
