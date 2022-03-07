import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:mobile_catch_a_ride/View_models/globals.dart' as globals;

class CurrentTextButtonModel extends StatefulWidget {
  const CurrentTextButtonModel({Key? key}) : super(key: key);

  @override
  _CurrentTextButtonModelState createState() => _CurrentTextButtonModelState();
}

class _CurrentTextButtonModelState extends State<CurrentTextButtonModel> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _animateCameraToCurrent(),
      style: TextButton.styleFrom(
        primary: Colors.greenAccent,
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
      child: const Text('CURRENT'),
    );
  }

  void _animateCameraToCurrent() {
    globals.googleMapController!.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: globals.current!.position,
          zoom: 18.5,
          tilt: 60.0,
        ),
      ),
    );
    setState(() {});
  }
}

class DestinationTextButtonModel extends StatefulWidget {
  const DestinationTextButtonModel({Key? key}) : super(key: key);

  @override
  _DestinationTextButtonModelState createState() => _DestinationTextButtonModelState();
}

class _DestinationTextButtonModelState extends State<DestinationTextButtonModel> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _animateCameraToDestination(),
      style: TextButton.styleFrom(
        primary: Colors.redAccent,
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
      child: const Text('DESTINATION'),
    );
  }

  void _animateCameraToDestination() {
    globals.googleMapController!.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: globals.destination!.position,
          zoom: 18.5,
          tilt: 60.0,
        ),
      ),
    );
    setState(() {});
  }
}
