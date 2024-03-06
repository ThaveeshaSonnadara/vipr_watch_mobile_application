import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  static double? userLocationLat;
  static double? userLocationLng;

  static void setUsersCurrentLocation(LatLng position) {
    userLocationLat = position.latitude;
    userLocationLng = position.longitude;
  }

  static double? targetLocationLat;
  static double? targetLocationLng;

  static void setTargetLocation(LatLng position) {
    targetLocationLat = position.latitude;
    targetLocationLng = position.longitude;
  }

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static double? userLocationLat = MapPage.userLocationLat;
  static double? userLocationLng = MapPage.userLocationLng;

  static LatLng currentLocation = LatLng(userLocationLat!, userLocationLng!);

  static double? targetLocationLat = MapPage.targetLocationLat;
  static double? targetLocationLng = MapPage.targetLocationLng;

  static LatLng targetLocation = LatLng(targetLocationLat!, targetLocationLng!);

  final Completer<GoogleMapController> _controller = Completer();

  Set<Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};

  static CameraPosition initialPosition =
      CameraPosition(target: currentLocation, zoom: 15.0);

  static CameraPosition targetPosition = CameraPosition(
      target: targetLocation, zoom: 15.0, bearing: 192.0, tilt: 60);

  PolylinePoints polylinePoints = PolylinePoints();

  Future<void> makePolyline(
      LatLng currentPosition, LatLng targetPosition) async {
    final GoogleMapController controller = await _controller.future;

    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(targetPosition.latitude, targetPosition.longitude),
        zoom: 15.0)));

    markers.clear();

    markers.add(Marker(
        markerId: const MarkerId("currentLocation"),
        icon: BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(
              size: Size(30, 30),
            ),
            "current_location.png") as BitmapDescriptor,
        position: LatLng(currentPosition.latitude, currentPosition.longitude)));
    markers.add(Marker(
        markerId: const MarkerId("targetLocation"),
        position: LatLng(targetPosition.latitude, targetPosition.longitude)));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            //         builder: (context) =>
            //             const NavigationMenu())); // Implement the back button functionality
          },
        ),
      ),
      body: GoogleMap(
          initialCameraPosition: initialPosition,
          markers: markers,
          zoomControlsEnabled: false,
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          polylines: Set<Polyline>.of(polylines.values)),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          makePolyline(currentLocation, targetLocation);
        },
        label: const Text("Show Path"),
        icon: const Icon(Icons.near_me),
      ),
    );
  }
}
