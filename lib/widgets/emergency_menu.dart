import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vipr_watch_mobile_application/screens/hospital_location/nearby_hospitals_page.dart';
import 'package:vipr_watch_mobile_application/screens/snake_catchers/SnakeCatchers.dart';

class EmergencyMenu extends StatefulWidget {
  const EmergencyMenu({super.key, this.body});

  final Widget? body;

  @override
  State<EmergencyMenu> createState() => _EmergencyMenuState();
}

class _EmergencyMenuState extends State<EmergencyMenu> {
  final ambulanceNumber = '+1990';

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
      //   body: Column(
      //     children: [
      //       Flexible(
      //           flex: 8,
      //           child: Container(
      //             padding: const EdgeInsets.symmetric(
      //               vertical: 0,
      //               horizontal: 40.0,
      //             ),
      //             child: Center(
      //                 child: RichText(
      //               textAlign: TextAlign.center,
      //               text: const TextSpan(children: [
      //                 TextSpan(
      //                     text: 'Welcome\n\n',
      //                     style: TextStyle(
      //                       fontSize: 55.0,
      //                       color: Colors.green,
      //                       fontWeight: FontWeight.w600,
      //                     )),
      //                 TextSpan(
      //                     text: '\n\n\nViprWatch\n\n\n',
      //                     style: TextStyle(
      //                       fontSize: 40.0,
      //                       color: Colors.green,
      //                       fontWeight: FontWeight.w600,
      //                     )),
      //               ]),
      //             )),
      //           )),
      //     ],
      //   ),
      // backgroundColor: Colors.black,
      // floatingActionButton: SpeedDial(
    return SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          backgroundColor: Colors.green,
          overlayColor: Colors.black,
          overlayOpacity: 0.8,
          spacing: 10,
          spaceBetweenChildren: 8,
          children: [
            SpeedDialChild(
              child: const Icon(
                Icons.call_outlined,
                color: Colors.green,
              ),
              backgroundColor: Colors.black,
              label: 'Snake Catchers',
              labelStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (e) => SnakeCatchers(),
                  ),
                );
              },
              // onTap: () => showToast('......'),
            ),
            SpeedDialChild(
              child: const Icon(
                Icons.map_outlined,
                color: Colors.green,
              ),
              backgroundColor: Colors.black,
              label: 'Hospitals',
              labelStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (e) => const NearbyPlacesPage(), //map page
                  ),
                );
              },
              // onTap: () => showToast('......'),
            ),
            SpeedDialChild(
              child: const Icon(
                Icons.emergency_outlined,
                color: Colors.green,
              ),
              backgroundColor: Colors.black,
              label: 'Ambulance',
              labelStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              onTap: () async {
                launch('tel://$ambulanceNumber');

                // await FlutterPhoneDirectCaller.callNumber(ambulanceNumber);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (e) => const SignupPage(),
                //   ),
                // );
              },
              // onTap: () => showToast('......'),
            )
          ],
    );
    // );
    //
    // Future showToast(String message) async {
    //   await Fluttertoast.cancel();
    //
    //   FlutterToast.showToast(msg: message, fontSize: 18);
    // }
  }
}
