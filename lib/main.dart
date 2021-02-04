<<<<<<< HEAD
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kopiku_kelompok11/ProfilePage.dart';
import 'package:kopiku_kelompok11/homePage.dart';
import 'package:kopiku_kelompok11/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
=======
import 'package:flutter/material.dart';
import 'package:kopiku_kelompok11/splashscreen.dart';

void main() {
>>>>>>> 1c8781166a55d96f0c323e5d2720ad3f85397b7c
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      title: 'Kopiku',
=======
      title: 'Flutter Demo',
>>>>>>> 1c8781166a55d96f0c323e5d2720ad3f85397b7c
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
<<<<<<< HEAD
      home: SplashScreen(),
=======
      home:SplashScreen(),
>>>>>>> 1c8781166a55d96f0c323e5d2720ad3f85397b7c
    );
  }
}
