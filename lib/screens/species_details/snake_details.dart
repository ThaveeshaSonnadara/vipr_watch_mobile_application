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
              child: SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 0.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            widget.identifiedSnakeDetails[0],
                            textAlign: TextAlign.justify,
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                fontFamily: 'Poppins',
                                color: Colors.black,
                                fontSize: 25),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 0.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Snake Scientific Name : \n' +
                                widget.identifiedSnakeDetails[1],
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                color: Colors.black,
                                fontSize: 18),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 0.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Snake Sinhala Name : \n' +
                              widget.identifiedSnakeDetails[2],
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                color: Colors.black,
                                fontSize: 18),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 0.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Venomous Type : ' +
                              widget.identifiedSnakeDetails[3],
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                color: Colors.black,
                                fontSize: 18),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 40.0, 0.0, 5.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Snake Details',
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                color: Colors.black,
                                fontSize: 20),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            15.0, 20.0, 10.0, 30.0),
                        child: Text(
                          widget.identifiedSnakeDetails[4],
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
