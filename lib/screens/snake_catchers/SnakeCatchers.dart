import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class snakeCatchers extends StatelessWidget {
  const snakeCatchers({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('Contact Snake Catchers', style: TextStyle(color: Colors.green)),
      ),
      body:Center(child:buildButton()),
    );
  }

  buildButton() {
    final number1 = '0719523132';

    return ListTile(
      title: Text('LBJ'),
      subtitle: Text(number1),
      trailing: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.green),
          ),
        ),
        child: Text('Call'),
        onPressed: () async {
          ('tel:$number1');
        },
      ),
    );
  }
}
