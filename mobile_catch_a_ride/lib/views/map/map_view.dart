import 'package:flutter/material.dart';
import 'package:mobile_catch_a_ride/controllers/nav_drawer/nav_drawer_controller.dart';

import 'package:mobile_catch_a_ride/views/globals.dart' as globals;

import 'package:mobile_catch_a_ride/controllers/map/map_controller.dart';
import 'package:mobile_catch_a_ride/controllers/position/position_controller.dart';
import 'package:mobile_catch_a_ride/controllers/floating_action_button/floating_action_button_controller.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {

  @override
  void dispose() {
    globals.googleMapController!.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    precacheImage(globals.userProfileImage!, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.black45,
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
