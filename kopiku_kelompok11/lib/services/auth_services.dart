import 'package:firebase_auth/firebase_auth.dart';
import 'package:kopiku_kelompok11/models/user_model.dart';
import 'package:kopiku_kelompok11/services/database_service.dart';

class AuthServices{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserModel _userFromFirebase(User user){
    return user != null ? UserModel(uid: user.uid) : null;
  }

  Stream<UserModel> get user{
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  // Sign in
  Future login(String email, String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebase(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  // Register
  Future register(String email, String password, String namaLengkap) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      
      // Store user data to database
      await DatabaseService(uid: user.uid).updateUserData(email, namaLengkap);

      return _userFromFirebase(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  // Sign out
  Future signOut() async{
    try{
      return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }
}