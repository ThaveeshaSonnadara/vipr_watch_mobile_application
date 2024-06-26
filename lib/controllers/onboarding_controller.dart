import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vipr_watch_mobile_application/utills/login_or_register.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  void updatePageIndicator(index) => currentPageIndex.value = index;

  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
  }

  // skip the onboarding pages to the last onboarding page
  void skipPage() {
    currentPageIndex.value = 3;
    pageController.jumpToPage(3);
  }

  // locate onboarding pages one by one
  void nextPage() {
    if (currentPageIndex.value == 3) {
      final storage = GetStorage();
      storage.write('isFirstTime', false);
      Get.offAll(const LoginOrRegister()); //LoginScreen
    } else {
      int page = currentPageIndex.value + 1;
      pageController.animateToPage(page,
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
  }
}
