import 'package:get/get.dart';
import 'package:salon_sac/core/base_controller.dart';
import 'package:salon_sac/models/app_transaction.dart';
import 'package:salon_sac/repositories/transaction_repository.dart';

class DashboardController extends BaseController {
  late final TransactionRepository _transactionRepository;
  final myTransaction = <AppTransaction>[].obs;

  final montlyIncome = 0.0.obs;
  final montlyExpense = 0.0.obs;

  void montlyTransaction() {
    montlyIncome.value = 0.0;
    montlyExpense.value = 0.0;
    var thisDate = DateTime.now();
    var thisYear = thisDate.year;
    var thisMonth = thisDate.month;

    if (myTransaction.isNotEmpty) {
      var filteredTransaction = myTransaction.where((transaction) {
        return transaction.date!.year == thisYear &&
            transaction.date!.month == thisMonth;
      }).toList();

      for (var tr in filteredTransaction) {
        if (tr.type == 'income') {
          montlyIncome.value += double.parse(tr.amount!);
        } else if (tr.type == 'expense') {
          montlyExpense.value += double.parse(tr.amount!);
        }
      }
    } else {
      montlyIncome.value = 0.0;
      montlyExpense.value = 0.0;
    }
  }

  @override
  void onInit() async {
    super.onInit();
    _transactionRepository = Get.find<TransactionRepository>();
    await getTransaction();
  }

  Future<void> refreshDashoard() async {
    await getTransaction();
  }

  Future getTransaction() async {
    try {
      setLoading(true);
      final transactions = await _transactionRepository.getTransactions();
      myTransaction.value = transactions;
      montlyTransaction();
    } catch (e) {
      showErrorSnackbar(message: 'Kasa işlemleri getirilirken hata oluştu!');
    } finally {
      setLoading(false);
    }
  }

  Future deleteTransaction(String id) async {
    try {
      final transactions = await _transactionRepository.deleteTransaction(id);
      myTransaction.removeWhere((e) => e.id == id);
      montlyTransaction();
      showSuccessSnackbar(message: 'İşlem silindi');
    } catch (e) {
      showErrorSnackbar(message: 'İşlem silinirken hata oluştu!');
    }
  }
}
