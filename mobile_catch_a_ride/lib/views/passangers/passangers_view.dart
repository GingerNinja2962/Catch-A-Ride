import 'package:flutter/material.dart';

import 'package:mobile_catch_a_ride/views/globals.dart' as globals;
import 'package:mobile_catch_a_ride/controllers/nav_drawer/nav_drawer_controller.dart';
import 'package:mobile_catch_a_ride/controllers/floating_action_button/floating_action_button_controller.dart';

class PassengerScreen extends StatefulWidget {
  const PassengerScreen({Key? key}) : super(key: key);

  @override
  _PassengerScreenState createState() => _PassengerScreenState();
}

class _PassengerScreenState extends State<PassengerScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Catch A Ride"),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: const [
          // NavDrawer(),
          Text("This is the List of available Passengers"),
        ],
      ),
      // floatingActionButton: FloatingActionButtonModel(notifyParent: refresh),
    );
  }

  refresh() {
    setState(() {});
  }
}
