import 'package:flutter/material.dart';

import 'package:mobile_catch_a_ride/views/globals.dart' as globals; // TODO remove if not used
import 'package:mobile_catch_a_ride/controllers/nav_drawer/nav_drawer_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  void initState() {
    super.initState();

    globals.userProfileImage = const AssetImage('assets/images/test_default_image_v4.jpg');
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
