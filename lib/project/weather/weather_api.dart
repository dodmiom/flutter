import 'dart:convert';

import 'package:day1/project/weather/weathe_modal.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  // https://api.openweathermap.org/data/2.5/weather?q=London&appid=886705b4c1182eb1c69f28eb8c520e20
  static final String _baseurl =
      'https://api.openweathermap.org/data/2.5/weather';
  static final String _foreurl =
      'https://pro.openweathermap.org/data/2.5/forecast';
  final String apikey;

  WeatherService(this.apikey);

  Future<Weather> getWeather(String cityname) async {
    final response = await http
        .get(Uri.parse('$_baseurl?q=$cityname&appid=$apikey&units=metric'));

    if (response.statusCode == 200) {
      return Weather.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception('failed to loadmeme');
    }
  }

  Future<Weather> get7daysWeather(String cityname) async {
    final response =
        await http.get(Uri.parse('$_foreurl/hourly?q=$cityname&appid=$apikey'));
    if (response.statusCode == 200) {
      return Weather.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception('failed to loadmeme');
    }
  }

  Future<String> getCurrentCity() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    String? city = placemarks[0].locality;
    return city ?? "";
  }
}
