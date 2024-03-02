import 'package:flutter/material.dart';

class SnakeDetailsTab extends StatefulWidget {
  const SnakeDetailsTab({super.key, required this.identifiedSnakeDetails});

  final List identifiedSnakeDetails;

  @override
  State<SnakeDetailsTab> createState() => _SnakeDetailsTabState();
}

class _SnakeDetailsTabState extends State<SnakeDetailsTab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(
              height: 10,
            ),
          ),
          Expanded(
            flex: 14,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25.0, 40.0, 25.0, 20.0),
              decoration: const BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  bottomLeft: Radius.circular(20.0),
                  // topRight: Radius.circular(30.0),
                  // bottomRight: Radius.circular(20.0)
                ),
              ),
              child: const SingleChildScrollView(
                child: Center(child: Text('tab 1')),
              ),
            ),),
        ],
      ),);
  }
}
