import 'package:flutter/material.dart';

import 'package:mobile_catch_a_ride/routes/routes.dart' as routes;
import 'package:mobile_catch_a_ride/routes/route_generator.dart';
import 'package:mobile_catch_a_ride/views/map/map_view.dart';
import 'package:mobile_catch_a_ride/views/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catch a Ride',
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
      ),
      home: const HomeView(),
      // home: const MapScreen(),
      initialRoute: routes.homePageRoute,
      onGenerateRoute: RouterNavigator.generateRoute,
    );
  }
}
