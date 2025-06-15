import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:salon_sac/modules/login/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            controller.loginWithGoogle();
          },
          child: Text('Google ile giriş yap'),
        ),
      ),
    );
  }
}
