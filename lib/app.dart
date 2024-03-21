import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of application
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
