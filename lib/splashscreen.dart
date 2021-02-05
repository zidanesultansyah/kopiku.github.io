import 'dart:async';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:kopiku_kelompok11/loginPage.dart';
=======
import 'package:kopiku_kelompok11/homePage.dart';
>>>>>>> 1c8781166a55d96f0c323e5d2720ad3f85397b7c
// import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    startSplashScreen();
    //Timer(Duration(seconds: 5), () => print("Splash Selesai!"));
  }
  startSplashScreen () async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, (){
      Navigator.push(
        context,
<<<<<<< HEAD
        MaterialPageRoute(builder: (context) => LoginPage ()
=======
        MaterialPageRoute(builder: (context) => HomePage ()
>>>>>>> 1c8781166a55d96f0c323e5d2720ad3f85397b7c
        )
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