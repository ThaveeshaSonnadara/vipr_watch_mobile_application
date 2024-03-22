import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:vipr_watch_mobile_application/screens/onboarding/onboarding.dart';
import 'package:vipr_watch_mobile_application/utills/login_or_register.dart';
import 'package:vipr_watch_mobile_application/widgets/network_check.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  get context => null;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    
    // check whether that the device is connected to the internet or not
    final hasInternet = await InternetConnectionChecker().hasConnection;
    if (hasInternet) {

      // store the boolean value in a storage to check that the user first time on application or not
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => const LoginOrRegister ())
          : Get.offAll(const OnBoardingScreen ());
    }
    else {
      Get.offAll(() => const CheckNetworkConnection());
    }
  }
}
