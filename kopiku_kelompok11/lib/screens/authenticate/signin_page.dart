import 'package:flutter/material.dart';
import 'package:kopiku_kelompok11/services/auth_services.dart';

class SigninPage extends StatefulWidget {

  final Function toggleView;
  SigninPage({this.toggleView});

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<SigninPage> {
  
  final AuthServices _authServices = AuthServices();
  final _formKey = GlobalKey<FormState>();

  // Text Field
  String email = '';
  String password = '';
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.brown[100],
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal:50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget> [
              SizedBox(height: 20.0),
              CircleAvatar(
                backgroundColor: Colors.brown,
                radius: 72.0,
                child: Icon(
                  Icons.free_breakfast,
                  color: Colors.white,
                  size: 82.0,
                )
              ),
              SizedBox(height: 20.0),
              Text(
                'Kopiku | Login',
                style: TextStyle(fontSize: 24.0),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  fillColor: Colors.brown[200],
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.brown, width: 1.0),
                  )
                ),
                validator: (val) => val.isEmpty ? 'Masukan email' : null,
                onChanged: (val){
                  setState(() => email = val);
                }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  fillColor: Colors.brown[200],
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.brown, width: 1.0),
                  )
                ),
                obscureText: true,
                validator: (val) => val.length < 6 ? 'Password harus lebih dari 6 karakter' : null,
                onChanged: (val){
                  setState(() => password = val);
                }
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.brown[700],
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async{
                  if(_formKey.currentState.validate()){
                    dynamic result = await _authServices.login(email, password);
                    if(result == null){
                      setState(() => errorMessage = 'Gagal melakukan login');
                    }
                  }
                },
              ),
              FlatButton(
                child: Text(
                  "Don't have an account yet? Register",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
                onPressed: () async{
                  widget.toggleView();
                },
              ),
              SizedBox(height: 12.0),
              Text(
                errorMessage,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          ),
        )
      ),
    );
  }
}
