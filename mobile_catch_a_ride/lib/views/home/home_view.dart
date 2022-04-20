import 'package:flutter/material.dart';

import 'package:mobile_catch_a_ride/views/globals.dart' as globals; // TODO remove if not used
import 'package:mobile_catch_a_ride/controllers/nav_drawer/nav_drawer_controller.dart';
import 'package:mobile_catch_a_ride/models/server_request/send_location_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  void initState() {
    super.initState();

    globals.userProfileName = "Henry Wessels"; // TODO make users data dynamic
    globals.userProfileImage = const AssetImage('assets/images/test_default_image_v4.jpg'); // TODO set default image
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    precacheImage(globals.userProfileImage!, context);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: const Key("HomePageView"),
      drawer: const NavDrawer(),
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.black45,
        title: const Text("Catch A Ride"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 110,
          ),
          ElevatedButton(
            onPressed: () async => {
              await SendLocation().SendPassengerLocation(),
            },
            child: const Text("Get a Ride", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25, color: Colors.lightBlueAccent),),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black38),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black38),
              shadowColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
              fixedSize: MaterialStateProperty.all<Size>(const Size(220.0, 40.0)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: const BorderSide(color: Colors.blueGrey)
                )
              )
            ),
          ),
        ]
      ),
    );
  }

  List<bool> expandableState = List.generate(8, (index) => false);

  Widget bloc (double width, int index) {
    bool isExpanded = expandableState[index];

    return GestureDetector(
      onTap: () {
        setState(() {
          //changing the current expandableState
          expandableState[index] = !isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.all(20.0),
        width: !isExpanded ? width * 0.4 : width * 0.8,
        height: !isExpanded ? width * 0.4 : width * 0.8,
        color: Colors.red,
      ),
    );
  }

  refresh() {
    setState(() {});
  }
}
