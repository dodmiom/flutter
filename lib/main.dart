import 'package:day1/class/day1.dart';
// import 'package:day1/project/networking/app.dart';
import 'package:day1/college/dashboard.dart';
import 'package:day1/college/mylistview.dart';
import 'package:day1/college/orderpage.dart';
import 'package:day1/college/place/placehome.dart';
import 'package:day1/college/project22.dart';
import 'package:day1/college/widget/admin_dashboard.dart';
import 'package:day1/pages/loginPage.dart';
import 'package:day1/project/calculator.dart';
import 'package:day1/project/fire1/fire/splashscreen.dart';
import 'package:day1/project/mp3/mp3home.dart';
import 'package:day1/project/mp3/mp3play.dart';
import 'package:day1/project/networking/app.dart';
import 'package:day1/project/newsapp/newshome.dart';
import 'package:day1/project/recep/recep.dart';
import 'package:day1/project/scanner/generatescan.dart';
import 'package:day1/project/scanner/getcodescan.dart';
import 'package:day1/project/shortvideo/videomain.dart';
import 'package:day1/project/speechtotxt/speecttotext.dart';
import 'package:day1/project/todo/todoHomee.dart';
import 'package:day1/project/translator/translate.dart';
import 'package:day1/project/weather/search_weather.dart';
import 'package:day1/project/weather/weather.dart';
import 'package:day1/project/weather/weatherforecast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await Hive.initFlutter();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var box = await Hive.openBox("mybox");

  // runApp(const myclass());
  runApp(const myfirebase());
  // runApp(const myclz());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: "/network",
      routes: {
        "/login": (context) => LoginPage(),
        "/home": (context) => Homepage(),
        "/dashboard": (context) => Dashboardpage(),
      },
    );
  }
}

class MyAppp extends StatelessWidget {
  const MyAppp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      title: 'Flutter Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: "/calculator",
      routes: {"/calculator": (context) => Calculator()},
    );
  }
}

class myclass extends StatelessWidget {
  const myclass({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      title: 'Flutter Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      routes: {
        "/home": (context) => Homepage(),
        "/project22": (context) => Project22(),
        "/weather": (context) => WeatherPage(),
        "/weather/search": (context) => SearchBarApp(),
        "/weather/forecast": (context) => WeatherForecastPage(),
        "/translate": (context) => Translate(),
        "/scanner": (context) => Getscancode(),
        "/scanner/generate": (context) => Generatescancode(),
        "/videotut": (context) => Videomain(),
        "/mp3": (context) => Mp3Play(),
        "/todo": (context) => Todohome(),
        "/speechtotext": (context) => Speecttotext(),
        "/newsapp": (context) => NewHome(),
      },
    );
  }
}

class myfirebase extends StatelessWidget {
  const myfirebase({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      title: 'Flutter Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => SplashScreenn(),
      },
    );
  }
}

class myclz extends StatelessWidget {
  const myclz({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      title: 'Flutter Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      routes: {
        "/home": (context) => Homepage(),
        "/dashboard": (context) => Dashboardpage(),
        "/order": (context) => OrderPage(),
        "/project22": (context) => Project22(),
        "/scanner/generate": (context) => Generatescancode(),
        "/listview": (context) => MylistView(),
        "/admindashboard": (context) => AdminDashboard(),
        "/place": (context) => PlaceHome(),
      },
    );
  }
}
