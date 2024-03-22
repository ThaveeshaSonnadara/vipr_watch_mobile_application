import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vipr_watch_mobile_application/screens/hospital_location/nearby_hospitals_page.dart';

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

  CameraPosition initialPosition =
      CameraPosition(target: currentLocation, zoom: 16.0);

  CameraPosition targetPosition = CameraPosition(
      target: targetLocation, zoom: 16.0, bearing: 192.0, tilt: 60);

  PolylinePoints polylinePoints = PolylinePoints();

  Future<void> makePolyline(
      LatLng currentPosition, LatLng targetPosition) async {
    final GoogleMapController controller = await _controller.future;

    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(targetPosition.latitude, targetPosition.longitude),
        zoom: 16.0)));

    markers.clear();

    markers.add( Marker(
        markerId: const MarkerId("currentLocation"),
        position: LatLng(currentPosition.latitude, currentPosition.longitude)));
    markers.add(Marker(
        markerId: const MarkerId("targetLocation"),
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(targetPosition.latitude, targetPosition.longitude)));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          // style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.green)),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const NearbyPlacesPage())); // Implement the back button functionality
          },
        ),
      ),
      body: GoogleMap(
          initialCameraPosition: initialPosition,
          markers: markers,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          mapType: MapType.terrain,
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
