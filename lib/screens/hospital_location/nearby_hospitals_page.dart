import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:vipr_watch_mobile_application/models/nearby_response.dart';
import 'package:vipr_watch_mobile_application/screens/hospital_location/map_screen.dart';
import 'package:vipr_watch_mobile_application/widgets/emergency_menu.dart';
import 'package:vipr_watch_mobile_application/widgets/navigation_menu.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:location/location.dart' as loc;

class NearbyPlacesPage extends StatefulWidget {
  const NearbyPlacesPage({super.key});

  @override
  State<NearbyPlacesPage> createState() => _NearbyPlacesPageState();
}

class _NearbyPlacesPageState extends State<NearbyPlacesPage> {
  @override
  void initState() {
    super.initState();
    getNearbyPlaces();
  }

  String? apiKey = dotenv.env['API_KEY']; // API key
  String? radius = dotenv.env['RADIUS']; // Radius in meters

  //user's current location values
  late double latitude;
  late double longitude;

  late LatLng userPositionLatLng;

  NearbyPlacesResponse nearbyPlacesResponse = NearbyPlacesResponse();

  // late String locationAddress;

  Future<bool> setUserLocationLatLng() async {
    Object userPosition = await getCurrentLocation();

    if (userPosition != false) {
      userPosition = userPosition as loc.LocationData;

      latitude = userPosition.latitude!;
      longitude = userPosition.longitude!;

      userPositionLatLng = LatLng(latitude, longitude);
      return true;
    } else {
      return false;
    }
  }

  void getNearbyPlaces() async {
    bool isLocationSet = await setUserLocationLatLng();
    if (isLocationSet) {

      var url = Uri.parse(
          'https://maps.googleapis.com/maps/api/place/nearbysearch/json?keyword=health&location=$latitude%2C$longitude&radius=$radius&type=hospital&key=$apiKey');

      var response = await http.post(url);

      nearbyPlacesResponse =
          NearbyPlacesResponse.fromJson(jsonDecode(response.body));

      setState(() {});
    }
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
    double? lat = results.geometry!.location!.lat;
    double? lng = results.geometry!.location!.lng;

    return LatLng(lat!, lng!);
  }

  Future<Object> getCurrentLocation() async {
    loc.Location location = loc.Location();
    location.enableBackgroundMode(enable: true);
    Future<bool> serviceEnabled;
    loc.PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == loc.PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted == loc.PermissionStatus.granted) {
        serviceEnabled = checkLocationServiceStatus(location);
        if (await serviceEnabled) {
          return await location.getLocation();
        }
      }
    } return false;
  }

  Future<bool> checkLocationServiceStatus(loc.Location location) async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        serviceEnabled = false;
        return serviceEnabled;
      }
    } return serviceEnabled;
  }

  ImageProvider<Object> getImage(Results results) {
    String? photoReference = results.photos?[0].photoReference;

    const baseUrl =
        "https://maps.googleapis.com/maps/api/place/photo?parameters";
    const maxWidth = "64";
    const maxHeight = "64";
    if (photoReference != null) {
      final url =
          "$baseUrl?maxwidth=$maxWidth&maxheight=$maxHeight&photoreference=$photoReference&key=$apiKey";
      return NetworkImage(url);
    } else {
      return const AssetImage('assets/images/map/null-image.png');
    }
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
          results.vicinity!,
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
        leading: CircleAvatar(
          radius: 22,
          backgroundImage: getImage(results),
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
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: const Text(
          "Nearby Hospitals",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                    const NavigationMenu())); // Implement the back button functionality
          },// Implement the back button functionality
        ),
      ),
      floatingActionButton: const EmergencyMenu(),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.only(left: 3.0, right: 3.0),
        children: [
          if (nearbyPlacesResponse.results != null &&
              nearbyPlacesResponse.results!.isNotEmpty)
            for (int i = 0; i < nearbyPlacesResponse.results!.length; i++)
              nearbyPlacesWidget(nearbyPlacesResponse.results![i]),
          if (nearbyPlacesResponse.results != null &&
              nearbyPlacesResponse.results!.isEmpty)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "No hospitals or medical centers found nearby (750m)",
                  style: TextStyle(color: Colors.white),
                  softWrap: true,
                ),
              ),
            ),
          if (nearbyPlacesResponse.results == null)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "Make sure to turn on your location and reload the page",
                  style: TextStyle(color: Colors.white),
                  softWrap: true,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
