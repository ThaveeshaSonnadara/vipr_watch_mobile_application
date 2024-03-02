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
                    bottomRight: Radius.circular(20.0)),
              ),
              child: SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 5.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'First Aid',
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                                decoration: TextDecoration.underline,
                                color: Colors.black,
                                fontSize: 25),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            15.0, 20.0, 10.0, 30.0),
                        child: Text(
                          widget.identifiedSnakeDetails[5],
                          textAlign: TextAlign.justify,
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
