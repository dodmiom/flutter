import 'dart:async';
import 'dart:ui';

import 'package:day1/project/weather/weathe_modal.dart';
import 'package:day1/project/weather/weather_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  // Constructor to receive data

  @override
  State<WeatherPage> createState() => _WeatherState();
}

class _WeatherState extends State<WeatherPage> {
  late Timer? timer;
  String hour1 = "0";
  String hour2 = "0";

  String minute1 = "0";

  String minute2 = "0";
  String second1 = "0";
  String second2 = "0";
  final df = DateFormat('HH:mm:ss');
  final time = DateTime.now();
  _timeclock() async {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      final time = DateTime.now();
      final printable = df.format(time);
      final splits = printable.split(":");
      final hour = splits[0];
      final minute = splits[1];
      final second = splits[2];
      setState(() {
        hour1 = hour.characters.first;
        hour2 = hour.characters.last;
        minute1 = minute.characters.first;
        minute2 = minute.characters.last;
        second1 = second.characters.first;
        second2 = second.characters.last;
      });
    });
  }

  final _weatherservice = WeatherService('886705b4c1182eb1c69f28eb8c520e20');
  Weather? _weather;

  _fetchWeather() async {
    //String cityname = await _weatherservice.getCurrentCity();
    print(_weatherservice.getWeather("london"));
    try {
      var weather = await _weatherservice.getWeather("london");

      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  String getWeatherAnimation(String? maincondition) {
    if (maincondition == null) return "assets/animate/sunny.json";

    switch (maincondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return "assets/animate/cloudy.json";
      case 'rain':
      case 'drizzle':
        return "assets/animate/rainy.json";
      case 'shower rain':
        return "assets/animate/sunrain.json";
      case 'thunderstorm':
        return "assets/animate/thunder.json";
      case 'clear':
        return "assets/animate/sunny.json";
      default:
        return "assets/animate/sunny.json";
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
    print(_weather);

    _timeclock();
  }

  String? data;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Your main content goes here
        Container(
          color: const Color.fromARGB(255, 2, 141, 255),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      child: Column(
                        children: [
                          Text(
                            '${DateFormat('EEEE').format(time)}',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                decoration: TextDecoration.none),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "$hour1$hour2:$minute1$minute2:$second1$second2",
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                decoration: TextDecoration.none),
                          ),
                        ],
                      ),
                    ),
                    Lottie.asset(getWeatherAnimation(_weather?.maincondition)),
                    SizedBox(
                        child: Column(
                      children: [
                        Text(
                          "${_weather?.maincondition ?? "Light Rain"}",
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 251, 0),
                              decoration: TextDecoration.none),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "${_weather?.temperature.round() ?? "76"} C",
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              decoration: TextDecoration.none),
                        ),
                      ],
                    )),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                  child: Container(
                    height: 160,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color:
                            Color.fromARGB(255, 77, 140, 233).withOpacity(0.6),
                        border: Border.all(
                            color: Colors.white.withOpacity(0.1), width: 2.5),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25))),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(25, 10, 25, 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Latitude",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w400,
                                          decoration: TextDecoration.none),
                                    ),
                                    Text(
                                      "${_weather?.latitude.round() ?? "77"} C",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300,
                                          decoration: TextDecoration.none),
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                                child: Column(
                                  children: [
                                    Text(
                                      "Pressure",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w400,
                                          decoration: TextDecoration.none),
                                    ),
                                    Text(
                                      "${_weather?.pressure.round() ?? "20"} K",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300,
                                          decoration: TextDecoration.none),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 11),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Center(
                                child: Column(
                                  children: [
                                    Text(
                                      "Longitude",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w400,
                                          decoration: TextDecoration.none),
                                    ),
                                    Text(
                                      "${_weather?.longitude.round() ?? "70"} C",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300,
                                          decoration: TextDecoration.none),
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                                child: Column(
                                  children: [
                                    Text(
                                      "Humidity",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w400,
                                          decoration: TextDecoration.none),
                                    ),
                                    Text(
                                      "${_weather?.humidity.round() ?? "79"} C",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300,
                                          decoration: TextDecoration.none),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(131, 3, 104, 187),
            ),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.menu, color: Colors.white),
                  onPressed: () {
                    // Implement action
                  },
                ),
                Text(
                  _weather?.cityname ?? "Loading City",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none),
                ),
                IconButton(
                  icon: Icon(Icons.search, color: Colors.white),
                  onPressed: () {
                    // Implement action
                  },
                ),
              ],
            ),
          ),
        ),
        // Your custom navigation bar
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: Color.fromARGB(131, 3, 104, 187),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.home, color: Colors.white),
                  onPressed: () {
                    // Implement action
                  },
                ),
                IconButton(
                  icon: Icon(Icons.search, color: Colors.white),
                  onPressed: () {
                    // Implement action
                  },
                ),
                IconButton(
                  icon: Icon(Icons.notifications, color: Colors.white),
                  onPressed: () {
                    // Implement action
                  },
                ),
                IconButton(
                  icon: Icon(Icons.equalizer_outlined, color: Colors.white),
                  onPressed: () {
                    // Implement action
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
