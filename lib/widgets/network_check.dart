import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'dart:io';

class CheckNetworkConnection extends StatefulWidget {
  const CheckNetworkConnection({super.key});

  @override
  State<CheckNetworkConnection> createState() => _CheckNetworkConnectionState();
}

class _CheckNetworkConnectionState extends State<CheckNetworkConnection> {

  @override
  void initState() {
    super.initState();

    Future(() {
      networkErrorPopUp();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 300.0, 0.0, 0.0),
                child: CircularProgressIndicator(
                  color: Colors.green,
                  strokeWidth: 6.0,
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                  child: Text(
                    'Connecting...',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                        color: Colors.green,
                        fontSize: 30),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  // method to pop out a error message if an network error is occurred
  Future<void> networkErrorPopUp() async {

    String msg = 'Your device is not connected to a network !\nCheck your connection !';
    String title = 'Network Connection Failed';
    String imgPath = 'assets/images/image_process/network error.json';

    await Dialogs.materialDialog(
        context: context,
        msg: msg,
        title: title,
        lottieBuilder: Lottie.asset(
          imgPath,
          fit: BoxFit.contain,
        ),
        titleAlign: TextAlign.center,
        color: Colors.black,
        msgAlign: TextAlign.center,
        titleStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
            color: Colors.red,
            fontSize: 26),
        msgStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 16),
        actions: [
          IconsOutlineButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (e) => exit(0),
                ),
              );
            },
            text: 'Close',
            color: Colors.redAccent,
            iconData: Icons.cancel_rounded,
            textStyle: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14),
            iconColor: Colors.black,
          ),
        ]);
  }
}
