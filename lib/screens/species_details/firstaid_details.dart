import 'package:flutter/material.dart';

class FirstAidDetailsTab extends StatefulWidget {
  const FirstAidDetailsTab({super.key, required this.identifiedSnakeDetails});
  final List identifiedSnakeDetails;

  @override
  State<FirstAidDetailsTab> createState() => _FirstAidDetailsTabState();
}

class _FirstAidDetailsTabState extends State<FirstAidDetailsTab> {
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
                    // topLeft: Radius.circular(30.0),
                    // bottomLeft: Radius.circular(20.0),
                    topRight: Radius.circular(30.0),
                    bottomRight: Radius.circular(20.0)
                ),
              ),
              child: const SingleChildScrollView(
                child: Center(child: Text('These days, one of the key problems people face is efficient time management. Because of this reason, people are used to using online applications and systems. However, most people do notknow how to use these applications and systems. When people watch movies, they usually buytickets from the cinema. If the tickets are sold out, they need to return another day. The goal ofthis cinema booking application is to help users manage their time and spend more quality timewith family and friends. This application also has a simple and user-friendly interface designthat even a user without technical knowledge can use easily. Using this application, users indifferent countries can find their favourite newly released movies and the best cinema to enjoytheir movie time. Even the cinema staff can save the time they spend on customers so they canfocus on improving other areas of the cinema. This system will attract a wide range ofcustomers to use the application, and doing so benefits both the application user and thecinemas', style: TextStyle(fontSize: 17),),),
              ),
            ),),
        ],
      ),);
  }
}