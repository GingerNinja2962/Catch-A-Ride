import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:mobile_catch_a_ride/views/globals.dart' as globals;

import 'package:mobile_catch_a_ride/models/camera/gesture_detector.dart';
import 'package:mobile_catch_a_ride/models/camera/camera_model.dart';
import 'package:mobile_catch_a_ride/models/directions/directions_repo.dart';

class MapModel extends StatefulWidget {
  final Function() notifyParent;
  const MapModel({Key? key, required this.notifyParent}) : super(key: key);

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapModel> {
  late CameraControllers cameraControllers;

  @override
  void initState() {
    super.initState();
    globals.followUser = true;
    cameraControllers = CameraControllers(notifyParent: widget.notifyParent);
    cameraControllers.setCameraPositionToCurrent();
    print("=========== Map Init Finished ==========="); // TODO remove
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        myLocationButtonEnabled: false,
        myLocationEnabled: true,
        tiltGesturesEnabled: false,
        zoomControlsEnabled: false,
        mapToolbarEnabled: false,
        compassEnabled: false,
        initialCameraPosition: globals.currentCameraPosition!,
        onMapCreated: (controller) => globals.googleMapController = controller,
        markers: {
          if (globals.current != null) globals.current!,
          if (globals.destination != null) globals.destination!,
        },
        polylines: {
          if (globals.info != null) _polyline(),
        },
        onLongPress: _addDestination,
        onTap: _addCurrent,
        gestureRecognizers: Set() ..add(Factory<PanGestureRecognizer>(() => DetectUserPan(() {
          if (globals.followUser!) {
            setState(() {
              globals.followUser = false;
            });
          }
        }))),
    );
  }

  Polyline _polyline() {
    return Polyline(
      polylineId: const PolylineId('overview_polyline'),
      color: Colors.blueAccent,
      width: 6,
      points: globals.info!.polylinePoints!
          .map((e) => LatLng(e.latitude, e.longitude))
          .toList(),
    );
  }

  Future<void> _addCurrent(LatLng pos) async {
    globals.info = null;

    globals.current = Marker(
      markerId: const MarkerId("Current"),
      infoWindow: const InfoWindow(title: "Current position"),
      draggable: true,
      onDragEnd: (LatLng pos) => {
        globals.current = null,
        widget.notifyParent()
      },
      icon:
        BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: pos,
    );
    setState(() {});

    if (globals.destination != null) {
      final directions = await DirectionsRepository()
          .getDirections(
          current: globals.current!.position,
          destination: globals.destination!.position
      );
      globals.info = directions;
      CameraUpdate.newLatLngBounds(globals.info!.bounds!, 100.0);
    }
    widget.notifyParent();
  }

  Future<void> _addDestination(LatLng pos) async {
    globals.info = null;

    globals.destination = Marker(
      markerId: const MarkerId("Destination"),
      infoWindow: const InfoWindow(title: "Destination position"),
      draggable: true,
      onDragEnd: (LatLng pos) => {
        globals.destination = null,
        widget.notifyParent()
      },
      icon:
        BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      position: pos,
    );
    setState(() {});

    if (globals.current != null) {
      final directions = await DirectionsRepository()
          .getDirections(
          current: globals.current!.position,
          destination: globals.destination!.position
      );
      globals.info = directions;
      cameraControllers.animateCameraToPath();
    }
    widget.notifyParent();
  }
}
