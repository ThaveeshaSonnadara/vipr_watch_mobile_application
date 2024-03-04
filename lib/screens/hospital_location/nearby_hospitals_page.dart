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
      elevation: 1.0,
      child: ListTile(
        title: Text(
          results.name!,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        subtitle: Text(results.geometry?.location! as String),
        trailing: const Icon(Icons.arrow_forward_ios),
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
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white70,
        title: const Text("Nearby Hospitals"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: ListView(
          children: [
            if (nearbyPlacesResponse.results != null)
              for (int i = 0; i < nearbyPlacesResponse.results!.length; i++)
                nearbyPlacesWidget(nearbyPlacesResponse.results![i])
          ],
        ),
      ),
    );
  }
}
