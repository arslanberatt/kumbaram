import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:salon_sac/modules/profile/profile_controller.dart';
import 'package:salon_sac/modules/profile/widget/info_card.dart';
import 'package:salon_sac/services/theme_service.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                controller.user.value?.profilePhoto ?? '',
              ),
            ),
            InfoCard(
              title: 'Adı',
              value: controller.user.value?.firstName ?? '',
            ),
            InfoCard(
              title: 'Soyadı',
              value: controller.user.value?.lastName ?? '',
            ),
            InfoCard(title: 'Email', value: controller.user.value?.email ?? ''),
            SettingsCard(),
          ],
        ),
      ),
    );
  }
}

class SettingsCard extends StatelessWidget {
  SettingsCard({super.key});
  final ThemeService themeService = Get.find<ThemeService>();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.brightness_6_outlined),
        title: Text('Tema'),
        trailing: Obx(
          () => Switch(
            value: themeService.isDarkMode,
            onChanged: (value) => themeService.toogleTheme(),
          ),
        ),
      ),
    );
  }
}
