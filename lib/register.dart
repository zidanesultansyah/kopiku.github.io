import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kopiku_kelompok11/homePage.dart';
import 'package:kopiku_kelompok11/services/AuthServices.dart';

import 'loginPage.dart';

class RegisterPage extends StatefulWidget {
  static String tag = 'Register-page';
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final globalkey = GlobalKey<ScaffoldState>();

  final AuthServices _auth = AuthServices();

  TextEditingController emailCtrl = new TextEditingController();
  TextEditingController passwordCtrl = new TextEditingController();
  TextEditingController usernameCtrl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.brown,
        radius: 48.0,
        child: Image.asset('assets/header3.jpeg'),
      ),
    );

    final email = TextFormField(
      controller: emailCtrl,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      controller: passwordCtrl,
      autofocus: false,
      // initialValue: 'cepi',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final username = TextFormField(
      controller: usernameCtrl,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final registerButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          if (emailCtrl.text != "" && passwordCtrl.text != "") {
            dynamic result = _auth.register(emailCtrl.text, passwordCtrl.text);
            if (result != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            }
          }
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => LoginPage(),
          //   ),
          // );
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('register', style: TextStyle(color: Colors.white)),
      ),
    );

    final loginLabel = FlatButton(
      child: Text(
        'login',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      },
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/LoginCoffee.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          key: globalkey,
          backgroundColor: Colors.white,
          body: Center(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: <Widget>[
                logo,
                SizedBox(height: 48.0),
                email,
                SizedBox(height: 8.0),
                password,
                SizedBox(height: 24.0),
                username,
                SizedBox(height: 8.0),
                registerButton,
                loginLabel,
                forgotLabel
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showAlertDialogCupertino(text) {
    showDialog(
      context: globalkey.currentContext,
      builder: (_) => CupertinoAlertDialog(
        title: Text('Info'),
        content: Text(text),
        actions: [
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          FlatButton(
            child: Text('Other Method'),
            onPressed: () {},
          ),
        ],
      ),
      barrierColor: Colors.black.withOpacity(0.5),
      barrierDismissible: false,
    );
  }
}
