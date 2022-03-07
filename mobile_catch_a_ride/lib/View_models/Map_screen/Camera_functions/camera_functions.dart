import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../Directions_API/current_location_query.dart';
import 'package:mobile_catch_a_ride/View_models/globals.dart' as globals;

class CameraControllers {
  final Function() notifyParent;
  const CameraControllers({required this.notifyParent});

  void animateCameraToCurrentLocation() {
    if (globals.currentPosition != null) {
      globals.currentCameraPosition = CameraPosition(
        target: LatLng(
            globals.currentPosition!.latitude,
            globals.currentPosition!.longitude),
        zoom: 16.5,
      );
      _animateCamera();
    }
  }

  void animateCameraToCurrentLocationTilted() {
    if (globals.currentPosition != null) {
      globals.currentCameraPosition = CameraPosition(
        target: LatLng(
            globals.currentPosition!.latitude,
            globals.currentPosition!.longitude),
        zoom: 16.5,
        tilt: 40,
      );
      _animateCamera();
    }
  }

  void animateCameraToCurrentMarker() {
    if (globals.current != null) {
      globals.currentCameraPosition = CameraPosition(
        target: globals.current!.position,
        zoom: 16.5,
      );
      _animateCamera();
    }
  }

  void animateCameraToCurrentMarkerTilted() {
    if (globals.current != null) {
      globals.currentCameraPosition = CameraPosition(
        target: globals.current!.position,
        zoom: 16.5,
        tilt: 60,
      );
      _animateCamera();
    }
  }

  void animateCameraToDestinationMarker() {
    if (globals.destination != null) {
      globals.currentCameraPosition = CameraPosition(
        target: globals.destination!.position,
        zoom: 16.5,
      );
      _animateCamera();
    }
  }

  void animateCameraToDestinationMarkerTilted() {
    if (globals.destination != null) {
      globals.currentCameraPosition = CameraPosition(
        target: globals.destination!.position,
        zoom: 16.5,
        tilt: 60.0,
      );
      _animateCamera();
    }
  }

  void animateCameraToPath() {
    globals.googleMapController!.animateCamera(
        CameraUpdate.newLatLngBounds(globals.info!.bounds!, 100.0)
    );
  }

  void _animateCamera() {
    (globals.googleMapController != null)
    ? globals.googleMapController!.animateCamera(
        CameraUpdate.newCameraPosition(globals.currentCameraPosition!))
    : null;
  }

  Future<void> setCameraPositionToCurrent() async {
    try {
      getPositionStream().listen((Position? position) {
        (position != null)
        ? {
          globals.currentPosition = position,
          if (globals.followUser != null) {
            if (globals.followUser!) {
              globals.currentCameraPosition = CameraPosition(
                target: LatLng(
                    globals.currentPosition!.latitude,
                    globals.currentPosition!.longitude),
                zoom: 16.5,
                bearing: globals.currentPosition!.heading,
              ),
              _animateCamera(),
              print("camera should update to current")
            }
          },
          // notifyParent(),
        } : null;
      });
    } catch (e) {
      print("Error : ${e.toString()}");
    }

    globals.currentCameraPosition = const CameraPosition(
      target:
      // LatLng(-26.076143, 28.200449), // Terenure
      LatLng(-26.0860, 28.2485), // Kempton
      zoom: 12.5,
    );
  }
}