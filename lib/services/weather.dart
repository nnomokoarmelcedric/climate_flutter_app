import 'dart:async';
import 'package:flutter/material.dart';
import 'location.dart';
import 'networking.dart';

const openWeatherMapUrl = "https://api.openweathermap.org/data/2.5/weather";
const String apiKey = '75163a5d74a070084b7e72868c19020b';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper();
    var Url =
        Uri.parse('$openWeatherMapUrl?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData(Url);
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper();
    var Url = Uri.parse(
        '$openWeatherMapUrl?lat=${location.Latitude}&lon=${location.Longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData(Url);
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
