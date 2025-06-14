import 'package:get/get.dart';

class AppBinding implements Bindings {
  @override
  Future<void> dependencies() async{
    await Get.put(dependency) 
     }
}
