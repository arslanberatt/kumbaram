import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:salon_sac/modules/transaction/controllers/transaction_controller.dart';

class DateInput extends GetView<TransactionController> {
  const DateInput({super.key});

  String _formatDate(DateTime date) {
    return DateFormat('d MMMM y').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListTile(
        title: Text("Tarih"),
        subtitle: Text(_formatDate(controller.date.value)),
        trailing: Icon(Icons.calendar_today),
        onTap: () async {
          final DateTime? secilenTarih = await showDatePicker(
            context: context,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            initialDate: controller.date.value,
          );
          if (secilenTarih != null) {
            controller.date.value = secilenTarih;
          }
        },
      ),
    );
  }
}
