library mobile_catch_a_ride.globals;

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../Directions_API/directions_model.dart';

GoogleMapController? googleMapController;
CameraPosition? currentCameraPosition;
Position? currentPosition;
Marker? current;
Marker? destination;
Directions? info;
bool? followUser;
