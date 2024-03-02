import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import '../screens/image_input/image_input.dart';
import 'emergency_menu.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBarTheme(
          data: NavigationBarThemeData(
              indicatorColor: Colors.green,
              labelTextStyle: MaterialStateProperty.all(const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.green,
              ))),
          child: NavigationBar(
            height: 70,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            animationDuration: const Duration(milliseconds: 500),
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            backgroundColor: Colors.black,
            destinations: const [
              NavigationDestination(
                  selectedIcon: Icon(Iconsax.home, color: Colors.black),
                  icon: Icon(Iconsax.home, color: Colors.green),
                  label: 'Home'),
              NavigationDestination(
                  selectedIcon: Icon(Iconsax.scan, color: Colors.black),
                  icon: Icon(Iconsax.scan, color: Colors.green),
                  label: 'Scan'),
              NavigationDestination(
                  selectedIcon:
                      Icon(Iconsax.search_favorite, color: Colors.black),
                  icon: Icon(Iconsax.search_favorite, color: Colors.green),
                  label: 'Search'),
              NavigationDestination(
                  selectedIcon: Icon(Iconsax.user, color: Colors.black),
                  icon: Icon(Iconsax.user, color: Colors.green),
                  label: 'Profile'),
            ],
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    Container(
      color: Colors.black,
    ),
    const ImageInputScreen(),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.green,
    ),
  ];
}
