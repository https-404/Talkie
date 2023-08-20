import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

enum AuthStatus {
  notAuthenticated,
  authenticating,
  authenticated,
  userNotFound,
  error
}


class AuthProvider extends ChangeNotifier {

  late AuthStatus status;
  late FirebaseAuth _auth;
  late Firebase user;
  static AuthProvider instance= AuthProvider();

  AuthProvider() {
    _auth = FirebaseAuth.instance;
  }

  Future<void> loginUserwithEmailandPassword(String _email, String _password) async {
     status =  AuthStatus.authenticating;
     notifyListeners();
    try {
     UserCredential _result = await _auth.signInWithEmailAndPassword(email: _email, password: _password);
     user = _result.user as Firebase;
     status = AuthStatus.authenticated;
    //navigate to homepage
      print("Logged in successfully");

    } catch(e) {

    }
  }
}