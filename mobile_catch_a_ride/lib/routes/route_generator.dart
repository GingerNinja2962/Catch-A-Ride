import 'package:flutter/material.dart';

import 'package:mobile_catch_a_ride/views/map/map_view.dart';
import 'package:mobile_catch_a_ride/views/home/home_view.dart';
import 'package:mobile_catch_a_ride/views/settings/settings_view.dart';
import 'package:mobile_catch_a_ride/routes/routes.dart' as route;

class RouterNavigator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case route.homePageRoute:
        return MaterialPageRoute<HomeView>(builder: (context) => const HomeView());

      case route.mapPageRoute:
        return MaterialPageRoute<MapView>(builder: (context) => const MapView());

      // case route.profilePageRoute: // TODO add view model controller
      //   return MaterialPageRoute<ProfileView>(builder: (context) => ProfileView());

      case route.settingsPageRoute: // TODO add view model controller
        return MaterialPageRoute<SettingsView>(builder: (context) => SettingsView());

      // case route.helpAndAboutPageRoute: // TODO add view model controller
      //   return MaterialPageRoute<HelpAboutView>(builder: (context) => HelpAboutView());

      default:
        return MaterialPageRoute<HomeView>(builder: (context) => const HomeView());
    }
  }
}