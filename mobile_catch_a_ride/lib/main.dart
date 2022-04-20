import 'package:flutter/material.dart';

import 'package:mobile_catch_a_ride/views/globals.dart' as globals;
import 'package:mobile_catch_a_ride/routes/routes.dart' as routes;
import 'package:mobile_catch_a_ride/routes/route_generator.dart';
import 'package:mobile_catch_a_ride/views/home/home_view.dart';

void main() {
  globals.homeSelected = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // checkerboardRasterCacheImages: true, // TODO CHECK if images are cached
      debugShowCheckedModeBanner: false,
      title: 'Catch a Ride',
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: Colors.grey
      ),
      home: const HomeView(),
      initialRoute: routes.homePageRoute,
      onGenerateRoute: RouterNavigator.generateRoute,
    );
  }
}
