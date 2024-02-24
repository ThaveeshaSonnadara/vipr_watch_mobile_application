import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vipr_watch_mobile_application/widgets/Loaders/animation_loader.dart';

///A utility class for managing a full screen loader

class FullScrrenLoader {
  ///open a full screen loading dialog with a given text and animation
  ///this method doesn't return anything

  ///parameters:-
  ///--text: the text to be displayed in the loading dialog.
  ///--animation: the lottie animation to be shown.

  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
          canPop: false,
          child: Container(
            color: Colors.black.withOpacity(0.5),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 250),
                AnimationLoaderWidget(text: text, animation: animation),
              ],
            ),
          )),
    );
  }

  ///stop the currently open loading dialog
  ///this method doesn't return anything
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop(); //close the dialog using the navigator
  }
}
