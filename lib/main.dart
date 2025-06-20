import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:salon_sac/core/app_bindings.dart';
import 'package:salon_sac/routers/app_pages.dart';
import 'package:salon_sac/themes/app_theme.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override 
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      getPages: AppPages.pages,
      initialRoute: AppRoutes.INITIAL,
      initialBinding: AppBinding(),
      darkTheme: AppTheme.dark,
      theme: AppTheme.light
    );
  }
}
 