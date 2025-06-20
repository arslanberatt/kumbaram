import 'package:get/instance_manager.dart';
import 'package:salon_sac/modules/transaction/controllers/transaction_controller.dart';

class TransactionBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>TransactionController());
  }
}
