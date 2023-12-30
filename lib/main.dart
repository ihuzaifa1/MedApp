import 'package:flutter/material.dart';
import 'package:medicare_dart/SplashPage.dart';

import 'HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MedApp",
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
