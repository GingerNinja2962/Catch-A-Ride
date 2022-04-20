import 'package:flutter/material.dart';

import 'package:mobile_catch_a_ride/views/globals.dart' as globals; // TODO remove if not used
import 'package:mobile_catch_a_ride/controllers/nav_drawer/nav_drawer_controller.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {

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
        children: const [
          Text("This is the Settings"),
        ],
      ),
    );
  }

  refresh() {
    setState(() {});
  }
}
