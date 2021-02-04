import 'package:flutter/material.dart';
import 'package:kopiku_kelompok11/services/auth_services.dart';

class RegisterPage extends StatefulWidget {

  final Function toggleView;
  RegisterPage({this.toggleView});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final AuthServices _authServices = AuthServices();
  final _formKey = GlobalKey<FormState>();

  // Text Field
  String email = '';
  String password = '';
  String namaLengkap = '';
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
                'Kopiku | Register',
                style: TextStyle(fontSize: 24.0),
              ),

              // [--- Form Nama Lengkap ---]
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Nama',
                  fillColor: Colors.brown[200],
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.brown, width: 1.0),
                  )
                ),
                validator: (val) => val.isEmpty ? 'Masukan nama' : null,
                onChanged: (val){
                  setState(() => namaLengkap = val);
                }
              ),

              // [--- Form Email ---]
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

              // [--- Form Password ---]
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

              // [--- Button Register ---]
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.brown,
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async{
                  if(_formKey.currentState.validate()){
                    dynamic result = await _authServices.register(email, password, namaLengkap);
                    if(result == null){
                      setState(() => errorMessage = 'Please supply a valid email');
                    }
                  }
                },
              ),

              // [--- Button Login ---]
              FlatButton(
                child: Text(
                  'Already have an account? Login',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
                onPressed: () async{
                  widget.toggleView();
                },
              ),

              // [--- Error Message ---]
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