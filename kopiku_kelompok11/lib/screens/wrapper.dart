import 'package:flutter/material.dart';
import 'package:kopiku_kelompok11/models/user_model.dart';
import 'package:kopiku_kelompok11/screens/authenticate/authenticate.dart';
import 'package:kopiku_kelompok11/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserModel>(context);
    
    if(user == null){
      return Authenticate();
    } else{
      return HomePage();
    }
  }
}