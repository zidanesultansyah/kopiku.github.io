import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kopiku_kelompok11/ProfilePage.dart';
import 'package:kopiku_kelompok11/homePage.dart';
import 'package:kopiku_kelompok11/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kopiku',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
