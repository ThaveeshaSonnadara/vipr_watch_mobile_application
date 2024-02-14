import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../controllers/Signup_Controller.dart';

class TermsandConditions extends StatelessWidget {
  const TermsandConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    return Row(
      children: [
        SizedBox(
            width: 24.0,
            height: 24.0,
            child: Obx(() => Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) =>controller.privacyPolicy.value = !controller.privacyPolicy.value))),
        const SizedBox(width: 16.0),
        const Text.rich(TextSpan(
          children: [
            TextSpan(
                text: 'i agree to the terms and conditions and privacy policy',
                style: TextStyle(color: Colors.green, fontSize: 12.0)),
          ],
        ))
      ],
    );
  }
}
