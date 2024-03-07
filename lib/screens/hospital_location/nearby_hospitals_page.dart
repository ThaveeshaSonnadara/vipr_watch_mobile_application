import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:vipr_watch_mobile_application/models/nearby_response.dart';
import 'package:vipr_watch_mobile_application/screens/hospital_location/map_screen.dart';

class NearbyPlacesPage extends StatefulWidget {
  const NearbyPlacesPage({super.key});

  @override
  State<NearbyPlacesPage> createState() => _NearbyPlacesPageState();
}

class _NearbyPlacesPageState extends State<NearbyPlacesPage> {
  String apiKey = ""; // API key
  String radius = "500"; // Radius in meters

  //user's current location values
  late double latitude;
  late double longitude;

  late LatLng userPositionLatLng;

  NearbyPlacesResponse nearbyPlacesResponse = NearbyPlacesResponse();

  void setUserLocationLatLng() {
    Position userPosition = getCurrentLocation() as Position;
    latitude = userPosition.latitude;
    longitude = userPosition.longitude;

    userPositionLatLng = LatLng(latitude, longitude);
  }

  void getNearbyPlaces() async {
    setUserLocationLatLng();

    var url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latitude,$longitude&radius=$radius&key=$apiKey');

    var response = await http.post(url);

    nearbyPlacesResponse =
        NearbyPlacesResponse.fromJson(jsonDecode(response.body));

    setState(() {});
  }

  void openMapPage(Results results) {
    LatLng targetPositionLatLng = getLocationLatLang(results);

    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) {
        MapPage.setTargetLocation(targetPositionLatLng);
        MapPage.setUsersCurrentLocation(userPositionLatLng);
        return const MapPage();
      }),
    );
  }

  LatLng getLocationLatLang(Results results) {
    double lat = results.geometry!.location!.lat!;
    double lng = results.geometry!.location!.lng!;

    return LatLng(lat, lng);
  }

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error("Location services are disabled");
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permissions denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location permissions are permanently denied");
    }

    return await Geolocator.getCurrentPosition();
  }

  Widget nearbyPlacesWidget(Results results) {
    return Card(
      color: Colors.black54,
      child: ListTile(
        title: Text(
          results.name!,
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          results.geometry?.location! as String,
          style: const TextStyle(color: Colors.white70),
        ),
        trailing: IconButton(
          highlightColor: Colors.white54,
          icon: const Icon(
            color: Colors.white70,
            Icons.chevron_right,
            size: 30,
          ),
          onPressed: () {
            openMapPage(results);
          },
        ),
        leading: Icon(
          results.photos?[0] as IconData?,
          size: 30,
          semanticLabel: "HospitalImageReference",
        ),
        onTap: () {
          openMapPage(results);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nearby Hospitals"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => ();
            //             const NavigationMenu())); // Implement the back button functionality
          },
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.only(left: 3.0, right: 3.0),
        children: [
          if (nearbyPlacesResponse.results != null)
            for (int i = 0; i < nearbyPlacesResponse.results!.length; i++)
              nearbyPlacesWidget(nearbyPlacesResponse.results![i]),
          if (nearbyPlacesResponse.results == null)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text("No nearby places found"),
              ),
            )

          // for (int i = 0; i < 4; i++)
          //   Card(
          //     color: Colors.black54,
          //     child: ListTile(
          //       title: const Text(
          //         "Hospital Name",
          //         style: TextStyle(color: Colors.white),
          //       ),
          //       subtitle: const Text(
          //         "Address",
          //         style: TextStyle(color: Colors.white70),
          //       ),
          //       trailing: IconButton(
          //         highlightColor: Colors.white54,
          //         icon: const Icon(
          //           color: Colors.white70,
          //           Icons.chevron_right,
          //           size: 30,
          //         ),
          //         onPressed: () {},
          //       ),
          //       leading: const Icon(
          //         Icons.image_outlined,
          //         size: 30,
          //         color: Colors.white70,
          //       ),
          //       onTap: () {},
          //     ),
          //   )
        ],
      ),
    );
  }
}
