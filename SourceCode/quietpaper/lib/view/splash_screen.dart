import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quietpaper/view/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor("#FFB92D"),
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: HexColor("#FFB92D"),
              statusBarIconBrightness: Brightness.dark),
        ),
        backgroundColor: HexColor("#FFB92D"),
        body: Center(
          child: Icon(Icons.pets,color: HexColor("#FFFFFF"),size: 40),
        )
    );
  }
}

