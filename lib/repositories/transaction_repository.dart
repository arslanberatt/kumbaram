import 'package:get/get.dart';
import 'package:salon_sac/models/app_transaction.dart';
import 'package:salon_sac/services/api_services.dart';

class TransactionRepository extends GetxService {
  late final ApiServices _apiServices;

  @override
  void onInit() {
    super.onInit();
    _apiServices = Get.find<ApiServices>();
  }

  Future<List<AppTransaction>> getTransactions() async {
    final response = await _apiServices.get(ApiConstants.transactions);
    if (response.statusCode == 200) {
      var listOfData = response.data['transactions'] as List;
      return listOfData
          .map((transaction) => AppTransaction.fromJson(transaction))
          .toList();
    }
    throw Exception('Transactionlar getirilirken bir hata oluştu');
  }

  Future<AppTransaction> createTransaction(AppTransaction transaction) async {
    final response = await _apiServices.post(
      ApiConstants.transactions,
      data: transaction.toJson(),
    );
    if (response.statusCode == 201) {
      return AppTransaction.fromJson(response.data);
    }
    throw Exception('Transactionlar eklenirken bir hata oluştu');
  }

  Future<bool> deleteTransaction(String id) async {
    final response = await _apiServices.delete(
      '${ApiConstants.transactions}/$id',
    );
    if (response.statusCode == 200) {
      return true;
    }
    throw Exception('Transaction silinirken bir hata oluştu');
  }
}
