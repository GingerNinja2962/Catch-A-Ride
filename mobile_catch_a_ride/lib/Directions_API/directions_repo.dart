import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile_catch_a_ride/env/.env.dart';
import 'package:mobile_catch_a_ride/Directions_API/directions_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DirectionsRepository {
  static const String _baseURL = 'https://maps.googleapis.com/maps/api/directions/json?';

  late final Dio _dio;

  DirectionsRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<Directions> getDirections({
    @required LatLng? current,
    @required LatLng? destination,
  }) async {
    final response = await _dio.get(
      _baseURL,
      queryParameters: {
        'origin' : '${current!.latitude},${current.longitude}',
        'destination' : '${destination!.latitude},${destination.longitude}',
        'key' : googleAPIKey,
      },
    );

    if (response.statusCode == 200) {
      // print("${response.data}"); //TODO remove (only for testing use)
      return Directions.fromMap(response.data);
    }
    throw ArgumentError('Could Not get Directions');
  }
}
