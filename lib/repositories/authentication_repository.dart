import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vipr_watch_mobile_application/screens/snake_catchers/SnakeCatchers.dart';
import 'package:vipr_watch_mobile_application/utills/login_or_register.dart';
import '../screens/onboarding/onboarding.dart';
import '../widgets/navigation_menu.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    deviceStorage.erase();
    deviceStorage.writeIfNull('isFirstTime', true);
    deviceStorage.read('isFirstTime') != true
        ? Get.offAll(() => SnakeCatchers())
        : Get.offAll(const OnBoardingScreen());
  }
}
