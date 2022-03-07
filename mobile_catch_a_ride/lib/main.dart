import 'package:flutter/material.dart';
import 'package:mobile_catch_a_ride/View_models/Map_screen/map_screen.dart';

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
      home: const MapScreen(),
    );
  }
}
