import 'package:flutter/material.dart';
import 'package:kopiku_kelompok11/screens/authenticate/register_page.dart';
import 'package:kopiku_kelompok11/screens/authenticate/signin_page.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool switchLoginRegister = true;
  void toggleView(){
    setState(() => switchLoginRegister = !switchLoginRegister);
  }

  @override
  Widget build(BuildContext context) {
    if(switchLoginRegister){
      return SigninPage(toggleView: toggleView);
    }
    else{
      return RegisterPage(toggleView: toggleView);
    }
  }
}