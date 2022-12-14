import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../navigator/app_navigator.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => AppNavigator.toHome(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImageBackground(),
    );
  }
}

class ImageBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/logo.png"),
            ),
          ),
        ),
        // Container(margin: EdgeInsets.only(bottom: 80), child: CircularProgressIndicator(backgroundColor: Colors.green, valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),), alignment: Alignment.bottomCenter,)
      ],
    );
  }
}
