import 'package:flutter/material.dart';

import 'package:mobile_catch_a_ride/View_models/globals.dart' as globals;
import 'package:mobile_catch_a_ride/View_models/Map_screen/Camera_functions/camera_functions.dart';

class FloatingActionButtonModel extends StatefulWidget {
  final Function() notifyParent;
  const FloatingActionButtonModel({Key? key, required this.notifyParent}) : super(key: key);

  @override
  _FloatingActionButtonModelState createState() => _FloatingActionButtonModelState();
}

class _FloatingActionButtonModelState extends State<FloatingActionButtonModel> {
  late CameraControllers cameraControllers;
  late int tapCount;
  late int doubleTapCount;

  @override
  void initState() {
    cameraControllers = CameraControllers(notifyParent: widget.notifyParent);
    tapCount = 0;
    doubleTapCount = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.greenAccent,
      onLongPress: _onLongPress,
      onDoubleTap: _onDoublePress,
      child: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.black,
        onPressed: _onPress,
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }

  void _onLongPress() {
    (globals.info != null)
        ? {
      globals.followUser = false,
      cameraControllers.animateCameraToPath(),
      widget.notifyParent()
    } : null;
  }

  void _onDoublePress() {
    (globals.destination != null)
        ? {
      (doubleTapCount == 0)
      ? {
        globals.followUser = false,
        cameraControllers.animateCameraToDestinationMarkerTilted()
      } : null,
      (doubleTapCount == 1)
      ? {
        globals.followUser = false,
        cameraControllers.animateCameraToDestinationMarker()
      } : null,
      (doubleTapCount == 1)
          ? doubleTapCount = 0
          : doubleTapCount += 1,
      widget.notifyParent()
    } : null;
  }

  void _onPress() {
    (tapCount == 0)
    ? (globals.current != null)
      ? {
        globals.followUser = false,
        cameraControllers.animateCameraToCurrentMarkerTilted()
      } : tapCount += 2
    : null;
    (tapCount == 1)
    ? (globals.current != null)
      ? {
      globals.followUser = false,
      cameraControllers.animateCameraToCurrentMarker()
      } : tapCount += 2
    : null;
    (tapCount == 2)
    ? {
      globals.followUser = false,
      cameraControllers.animateCameraToCurrentLocationTilted()
    } : null;
    (tapCount == 3)
    ? {
      globals.followUser = true,
      cameraControllers.animateCameraToCurrentLocation()
    } : null;
    (tapCount == 3)
    ? tapCount = 0
    : tapCount += 1;
    widget.notifyParent();
  }
}
