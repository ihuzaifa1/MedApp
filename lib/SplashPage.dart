import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicare_dart/HomePage.dart';
import 'package:medicare_dart/MainPage.dart';
import 'package:medicare_dart/navbar.dart';



class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if(user != null){
      Timer(Duration(seconds: 3), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => navbar(),
            ));
      });
    }else{
      Timer(Duration(seconds: 3), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
      });
    }



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(child: Image.asset("assets/images/spl.png")),
      ),
    );
  }
}
