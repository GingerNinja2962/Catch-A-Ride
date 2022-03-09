import 'package:flutter/material.dart';

import 'package:mobile_catch_a_ride/routes/routes.dart' as routes;
import 'package:mobile_catch_a_ride/views/globals.dart' as globals;

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: const Key("NavigationMenu"),
      backgroundColor: Colors.black12,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _getDrawerHeader(context),
          ListTile(
            key: const Key("WelcomeListTile"),
            selected: globals.homeSelected,
            leading: const Icon(Icons.input),
            title: const Text('Welcome'),
            onTap: () => {
              _setCurrentRoute(routes.homePageRoute, context),
            },
          ),
          ListTile(
            key: const Key("CatchARideListTile"),
            selected: globals.mapSelected,
            leading: const Icon(Icons.directions_car_rounded),
            title: const Text('Catch-A-Ride'),
            onTap: () => {
              _setCurrentRoute(routes.mapPageRoute, context),
            },
          ),
          ListTile(
            key: const Key("ProfileListTile"),
            selected: globals.profileSelected,
            leading: const Icon(Icons.verified_user),
            title: const Text('Profile'),
            onTap: () => {
              _setCurrentRoute(routes.profilePageRoute, context),
            },
          ),
          ListTile(
            key: const Key("HelpListTile"),
            selected: globals.helpSelected,
            leading: const Icon(Icons.help_center_rounded),
            title: const Text('Help'),
            onTap: () => {
              _setCurrentRoute(routes.helpAndAboutPageRoute, context),
            },
          ),
        ],
      ),
    );
  }

  DrawerHeader _getDrawerHeader(BuildContext context){
    return DrawerHeader(
      key: const Key("NavMenuDrawerHeader"),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              _getInkWell(context)
            ],
          ),
          _getStack(),
        ],
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstIn),
              image: globals.userProfileImage!,
          )
      ),
    );
  }

  InkWell _getInkWell(BuildContext context){
    return InkWell(
      onTap: () => {
      _setCurrentRoute(routes.settingsPageRoute, context),
      },
      key: const Key("SettingsInkWell"),
      child: Stack(
        key: const Key("SettingsIconStack"),
        children: const <Widget>[
          Icon(
            Icons.settings,
            key: Key("SettingsIconBlack"),
            color: Colors.black54,
            size: 30,
          ),
          Positioned(
            child: Icon(
              Icons.settings,
              key: Key("SettingsIconWhite"),
              color: Colors.white,
              size: 26,
            ),
            top: 2,
            left: 2,
          ),
        ],
      ),
    );
  }

  Text _getStack() {
    return Text(
        (globals.userProfileName != null)
        ? globals.userProfileName!
        : "Anonymous",
        key: const Key("UserNameText"),
        style: const TextStyle(
            color: Colors.white,
            fontSize: 29,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(5.0, 5.0),
                blurRadius: 3.0,
                color: Colors.black87,
              ),
            ],
        ),
    );
  }

  void _setCurrentRoute(String route, BuildContext context) {
    (route == routes.settingsPageRoute)
    ? { if (globals.settingsSelected != true) {
      globals.settingsSelected = true,
      // Navigator.popAndPushNamed(context, routes.settingsPageRoute), // TODO MAKE settings page
    }} : globals.settingsSelected = false;

    (route == routes.homePageRoute)
    ? { if (globals.homeSelected != true) {
      globals.homeSelected = true,
      Navigator.popAndPushNamed(context, routes.homePageRoute),
    }} : globals.homeSelected = false;

    (route == routes.mapPageRoute)
    ? { if (globals.mapSelected != true) {
      globals.mapSelected = true,
      Navigator.popAndPushNamed(context, routes.mapPageRoute),
    }} : globals.mapSelected = false;

    (route == routes.profilePageRoute)
    ? { if (globals.profileSelected != true) {
        globals.profileSelected = true,
        // Navigator.popAndPushNamed(context, routes.profilePageRoute), // TODO MAKE profile page
    }} : globals.profileSelected = false;

    (route == routes.helpAndAboutPageRoute)
    ? { if (globals.helpSelected != true) {
        globals.helpSelected = true,
        // Navigator.popAndPushNamed(context, routes.helpAndAboutPageRoute), // TODO MAKE help page
    }} : globals.helpSelected = false;
  }
}
