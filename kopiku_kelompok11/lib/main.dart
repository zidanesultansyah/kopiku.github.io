import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kopiku_kelompok11/services/auth_services.dart';
import 'package:kopiku_kelompok11/splashscreen.dart';
import 'package:provider/provider.dart';
import 'package:kopiku_kelompok11/models/user_model.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
      value: AuthServices().user,
      child: MaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Kopiku',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.brown,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home:SplashScreen(),
//     );
//   }
// }
