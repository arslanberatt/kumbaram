import 'package:get/get.dart';
import 'package:salon_sac/modules/home/home_bindings.dart';
import 'package:salon_sac/modules/home/home_page.dart';
import 'package:salon_sac/modules/login/login_bindings.dart';
import 'package:salon_sac/modules/login/login_page.dart';
import 'package:salon_sac/modules/splash/splash_bindings.dart';
import 'package:salon_sac/modules/splash/splash_page.dart';
import 'package:salon_sac/modules/transaction/transaction_bindings.dart';
import 'package:salon_sac/modules/transaction/transaction_page.dart';

abstract class AppRoutes {
  static const INITIAL = SPLASH;
  static const SPLASH = '/splash';
  static const LOGIN = '/login';
  static const HOME = '/home';
  static const PROFILE = '/profile';
  static const TRANSACTION = '/transaction';
}

class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: AppRoutes.TRANSACTION,
      page: () => TransactionPage(),
      binding: TransactionBindings(),
    ),
  ];
}
