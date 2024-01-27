import 'package:flutter/material.dart';
import 'package:medicare_dart/SplashPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'HomePage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
