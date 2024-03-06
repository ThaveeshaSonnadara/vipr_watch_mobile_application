import 'package:flutter/material.dart';

class MyTestField extends StatelessWidget {

  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  const MyTestField({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white54),
      ),
      obscureText: obscureText,
      style: TextStyle(color: Colors.white),
    );
  }
}
