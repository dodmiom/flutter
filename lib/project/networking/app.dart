import 'package:day1/project/networking/network.dart';
// import 'package:day1/project/networking/theme.dart';
import 'package:flutter/material.dart';

class MyNetworkApp extends StatelessWidget {
  const MyNetworkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meme app",
      home: const Network_Home(),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.highContrastLight(),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.highContrastDark(),
      ),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
    );
  }
}
