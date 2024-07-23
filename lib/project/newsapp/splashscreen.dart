import 'dart:async';

import 'package:day1/project/newsapp/newshome.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashnewApp extends StatefulWidget {
  const SplashnewApp({super.key});

  @override
  State<SplashnewApp> createState() => _SplashnewAppState();
}

class _SplashnewAppState extends State<SplashnewApp> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => NewHome()));
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "",
            fit: BoxFit.cover,
            width: width * .9,
            height: height * .5,
          ),
          SizedBox(
            height: height * 0.04,
          ),
          Text(
            "Top Headlines",
            style: GoogleFonts.anton(
              letterSpacing: .6,
              color: Colors.grey.shade700,
            ),
          ),
          SizedBox(
            height: height * 0.04,
          ),
          SpinKitDualRing(color: Colors.blue, size: 50)
        ],
      ),
    );
  }
}
