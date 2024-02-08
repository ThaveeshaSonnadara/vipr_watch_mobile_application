import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vipr_watch_mobile_application/widgets/custom_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      displayAppBar: false,
      child: Column(
          children: [
          Flexible(
          flex: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 40.0,
            ),
            child: Center(child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                  children: [
                    TextSpan(
                        text: 'Welcome\n\n',
                        style: TextStyle(
                          fontSize: 55.0,
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                        )
                    ),
                    TextSpan(
                        text: '\n\n\nViprWatch\n\n\n',
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.green,
                          fontWeight:  FontWeight.w600,
                        )
                    ),
                  ]
              ),
            )),
          )),
    ],
    ),
    );
  }
}
