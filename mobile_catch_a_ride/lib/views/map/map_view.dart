import 'package:flutter/material.dart';

import 'package:mobile_catch_a_ride/views/globals.dart' as globals;

import 'package:mobile_catch_a_ride/controllers/map/map_controller.dart';
import 'package:mobile_catch_a_ride/controllers/position/position_controller.dart';
import 'package:mobile_catch_a_ride/controllers/floating_action_button/floating_action_button_controller.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  @override
  void dispose() {
    globals.googleMapController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Catch A Ride"),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          MapModel(notifyParent: refresh),
          if (globals.info != null) const PositionedModel(),
        ],
      ),
      floatingActionButton: FloatingActionButtonModel(notifyParent: refresh),
    );
  }

  refresh() {
    setState(() {});
  }
}
