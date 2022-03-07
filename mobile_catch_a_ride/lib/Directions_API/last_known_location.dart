import 'package:geolocator/geolocator.dart';


Future<Position> _getLastKnownLocation() async {
  Position? position;

  position = await Geolocator.getLastKnownPosition();
  if (position == null) {
    Future.error("There is no Last known Location information found on the device.");
  }
  return position!;
}