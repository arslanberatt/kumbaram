import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_sac/modules/dashboard/dashboard_page.dart';
import 'package:salon_sac/modules/home/home_controller.dart';
import 'package:salon_sac/modules/profile/profile_page.dart';
import 'package:salon_sac/themes/app_colors.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.info,
        title: Text('Kumbaram'),
        actions: [
          IconButton(
            onPressed: () {
              controller.cikisYap();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: [DashboardPage(), ProfilePage()],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.goToTransaction,
        shape: CircleBorder(),
        child: Icon(Icons.add, size: 32, color: AppColors.white),
        backgroundColor: AppColors.primaryDark,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () => AnimatedBottomNavigationBar(
          icons: [Icons.dashboard_outlined, Icons.person],
          activeIndex: controller.currentIndex.value,
          onTap: controller.changePage,
          gapLocation: GapLocation.center,
          splashColor: AppColors.white,
          activeColor: AppColors.white,
          inactiveColor: AppColors.grey,
          notchSmoothness: NotchSmoothness.softEdge,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          backgroundColor: AppColors.info,
        ),
      ),
    );
  }
}
