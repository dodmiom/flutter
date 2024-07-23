import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WeatherSplashScreen extends StatefulWidget {
  const WeatherSplashScreen({super.key});

  @override
  State<WeatherSplashScreen> createState() => _WeatherSplashScreenState();
}

class _WeatherSplashScreenState extends State<WeatherSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Lottie.asset("assets/animate/thunder.json"),
        Padding(
          padding: EdgeInsets.all(1.0),
          child: Column(
            children: [
              Text("Weather Astro",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      decoration: TextDecoration.none)),
              SizedBox(
                child: Text("Welcome to our weather",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        decoration: TextDecoration.none)),
              )
            ],
          ),
        )
      ])),
    ));
  }
}
