import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kopiku_kelompok11/screens/wrapper.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
@override
  void initState() {
    super.initState();
    startSplashScreen();
    //Timer(Duration(seconds: 5), () => print("Splash Selesai!"));
  }
  startSplashScreen () async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, (){
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Wrapper()),
        (Route<dynamic> route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.brown)
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: Icon(
                          Icons.free_breakfast,
                          color: Colors.brown,
                          size: 60.0,
                        )
                      ),
                      Padding(padding: EdgeInsets.only(top: 20.0),
                      ),
                      Text(
                         "Kopiku",
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 22.0,
                           fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Padding(padding: EdgeInsets.only(top: 20.0),
                  ),
                  Text("Loading...",
                  style: TextStyle(color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold)),
                ],
              ),
              )
            ],
          )
        ],
      ),
    );
  }
}