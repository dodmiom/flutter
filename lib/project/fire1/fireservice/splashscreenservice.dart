import 'dart:async';

import 'package:day1/project/fire1/fire/home.dart';
import 'package:day1/project/fire1/fire/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user != null) {
      Timer(const Duration(seconds: 3), () {
        Navigator.push(
            context, CupertinoPageRoute(builder: (context) => PostHome()));
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        Navigator.push(
            context, CupertinoPageRoute(builder: (context) => LoginScreen()));
      });
    }
  }
}
