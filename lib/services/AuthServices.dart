import 'package:firebase_auth/firebase_auth.dart';
import 'package:kopiku_kelompok11/model/user_model.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserModel _users(User user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  Stream<UserModel> get user {
    return _auth.authStateChanges().map(_users);
  }

  // Register
  Future register(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _users(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Login
  Future loginUser(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _users(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
