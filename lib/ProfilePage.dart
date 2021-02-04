import 'package:flutter/material.dart';
import 'package:kopiku_kelompok11/profile_screens/body_profile.dart';

class ProfilePage extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: BodyProfile(),
      
    );
  }
}
