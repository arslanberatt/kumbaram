import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_sac/modules/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text('HomePage')),
        ElevatedButton(onPressed: (){controller.cikisYap();}, child: Text('Çıkış Yap'))
      ],
    ));
  }
}
