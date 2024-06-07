import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  Location({this.Latitude, this.Longitude});

  late double? Latitude;
  late double? Longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      Latitude = position.latitude;
      Longitude = position.longitude;
    } catch (e) {
      print(e);
      print("unable to get location");
    }
  }
}
