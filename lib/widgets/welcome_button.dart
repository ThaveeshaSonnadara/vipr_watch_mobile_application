import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class WelcomeButton extends StatelessWidget {
  const WelcomeButton(
      {super.key, this.buttonText, this.onTap, this.color, this.textColor});
  final String? buttonText;
  final Widget? onTap;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (e) => onTap!,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 20,
          left: 20,
          right: 20,
        ),
        decoration: BoxDecoration(
          color: color!,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(50)),
        ),
        child: FittedBox(
          fit: BoxFit.contain,
          child: AutoSizeText(buttonText!,
              minFontSize: 16,
              maxFontSize: 20,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: textColor,
                overflow: TextOverflow.fade,
              )),
        ),
      ),
    );
  }
}
