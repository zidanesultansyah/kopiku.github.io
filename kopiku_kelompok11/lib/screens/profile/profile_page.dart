import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kopiku_kelompok11/screens/wrapper.dart';
import 'package:kopiku_kelompok11/services/auth_services.dart';
import 'package:kopiku_kelompok11/services/database_service.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {

  final String currentUID = FirebaseAuth.instance.currentUser.uid;

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService(uid: currentUID).users,
      child: Scaffold(
        backgroundColor: Colors.brown,
        appBar: AppBar(
          backgroundColor: Colors.brown,
          elevation: 0.0,
        ),
        body: UserList(),
      ),
    );
  }
}

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    
    final users = Provider.of<QuerySnapshot>(context);
    final AuthServices _authServices = AuthServices();

    var namaLengkap = TextEditingController();
    var email = TextEditingController();

    Map<String,dynamic> userData;

    if(users != null){
      for(var doc in users.docs){
        userData = doc.data();
      }
      namaLengkap.text = userData['name'];
      email.text = userData['email'];
    }

    Widget textFieldNama({@required String hintText, TextEditingController namaController}){
    return Material(
      elevation: 3,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: TextField(
        enabled: false,
        controller: namaController,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            letterSpacing: 2,
            color: Colors.black38,
            fontWeight: FontWeight.bold
          ),
          fillColor: Colors.white,
          filled: true,
          
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none
          )
        ),
      ),
    );
  }

  Widget textFieldEmail({@required String hintText, TextEditingController emailController}){
    return Material(
      elevation: 3,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: TextField(
        enabled: false,
        controller: emailController,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            letterSpacing: 2,
            color: Colors.black38,
            fontWeight: FontWeight.bold
          ),
          fillColor: Colors.white,
          filled: true,
          
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none
          )
        ),
      ),
    );
  }

    return SafeArea(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text('Profile',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 10.0),
          Expanded(
            child: Stack(
              alignment: Alignment.topCenter,
              fit: StackFit.loose,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 70),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)
                    )
                  ),
                ),
                ListView(children: [
                  Container(
                    padding: EdgeInsets.all(10.0),
                    width: 190,
                    height: 190,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.brown.withOpacity(0.2),
                          spreadRadius:6,
                          blurRadius:12,
                        )
                      ],
                      border: Border.all(color: Colors.white, width: 5),
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage("https://akcdn.detik.net.id/visual/2020/02/13/5e59651e-1b3f-4fe4-88e4-8ec5c9f05a08_169.jpeg?w=700&q=90"),
                      )
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(height: 15.0),
                      Container(
                        height: 450,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal:10),
                        child: Column(
                          children: [
                            textFieldNama(
                              hintText: "Nama Lengkap",
                              namaController: namaLengkap,
                            ),
                            SizedBox(height: 10.0),
                            textFieldEmail(
                              hintText: "Email",
                              emailController: email
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              height: 55,
                              width: double.infinity,
                              child: RaisedButton(
                                color: Colors.red,
                                child: Center(
                                  child: Text("Logout", style: TextStyle(fontSize: 16, color: Colors.white),),
                                ),
                                onPressed: () async{
                                  await _authServices.signOut();
                                  User currUser = FirebaseAuth.instance.currentUser;
                                  if(currUser == null) {
                                    await Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(builder: (context) => Wrapper()),
                                      (Route<dynamic> route) => false,
                                    );
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
