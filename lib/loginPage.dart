<<<<<<< HEAD
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kopiku_kelompok11/services/AuthServices.dart';
import 'homePage.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final globalkey = GlobalKey<ScaffoldState>();

  // Cek user current login

  // Get auth services
  final AuthServices _auth = AuthServices();

  TextEditingController emailCtrl = new TextEditingController();
  TextEditingController passwordCtrl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }

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

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () async {
          if (emailCtrl.text == "" || passwordCtrl.text == "") {
            showAlertDialogCupertino('Please input data correctly!');
          } else {
            dynamic result =
                await _auth.loginUser(emailCtrl.text, passwordCtrl.text);
            if (result != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            } else {
              loginDialog('Failed to login!');
            }
            // if (result != null) {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => HomePage(),
            //     ),
            //   );
            // } else {
            //   loginDialog('Failed to login!');
            // }
          }
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    final registerLabel = FlatButton(
      child: Text(
        'Register',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RegisterPage(),
          ),
        );
      },
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
                loginButton,
                registerLabel,
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

  void loginDialog(text) {
    showDialog(
      context: globalkey.currentContext,
      builder: (_) => CupertinoAlertDialog(
        title: Text('Info'),
        content: Text(text),
        actions: [
          FlatButton(
            child: Text('Close'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      barrierColor: Colors.black.withOpacity(0.5),
      barrierDismissible: true,
    );
  }
}
=======
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homePage.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final globalkey = GlobalKey<ScaffoldState>();
  TextEditingController nameController1 = new TextEditingController();
  TextEditingController nameController2 = new TextEditingController();
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
      controller: nameController1,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      controller: nameController2,
      autofocus: false,
      // initialValue: 'cepi',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          if (nameController1.text == '' || nameController2.text == '') {
            showAlertDialogCupertino('Please input data correctly!');
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          }
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      ),
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
                loginButton,
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
              Navigator.pop(globalkey.currentContext);
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
>>>>>>> 1c8781166a55d96f0c323e5d2720ad3f85397b7c
