import 'package:flutter/material.dart';

import 'package:mobile_catch_a_ride/View_models/globals.dart' as globals;
import 'package:mobile_catch_a_ride/View_models/Map_screen/Map_elements/map_model.dart';
import 'package:mobile_catch_a_ride/View_models/Map_screen/Map_elements/positioned_model.dart';
import 'package:mobile_catch_a_ride/View_models/Map_screen/Map_elements/text_buttons_model.dart';
import 'package:mobile_catch_a_ride/View_models/Map_screen/Map_elements/floating_action_button_model.dart';

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
