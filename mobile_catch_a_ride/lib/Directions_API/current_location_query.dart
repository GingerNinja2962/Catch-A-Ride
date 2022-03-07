import 'dart:async';

import 'package:geolocator/geolocator.dart';

Stream<Position> getPositionStream() {
  const LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    // distanceFilter: 1,
  );

  try {
    _setupPermissions();
  } catch (e) {
    Future.error(e);
  }

  return Geolocator.getPositionStream(locationSettings: locationSettings);
}

Future<Position> getPosition() async {
  try {
    await _setupPermissions();
  } catch (e) {
    throw Future.error(e);
  }

  return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
}

Future<void> _setupPermissions() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error("Location services are Disabled.");
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error("Location permissions are denied.");
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error("Location Permissions are permanently denied, permissions can no longer be requested.");
  }
}
