library mobile_catch_a_ride.globals;

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:mobile_catch_a_ride/models/directions/directions_model.dart';

GoogleMapController? googleMapController;
CameraPosition? currentCameraPosition;
Position? currentPosition;
Marker? current;
Marker? destination;
Directions? info;
bool? followUser;

bool homeSelected = false;
bool mapSelected = false;
bool profileSelected = false;
bool settingsSelected = false;
bool helpSelected = false;
