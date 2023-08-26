import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:talkie/services/navigation_service.dart';
import 'package:talkie/services/snackbar_service.dart';

enum AuthStatus {
  notAuthenticated,
  authenticating,
  authenticated,
  userNotFound,
  error
}

class AuthProvider extends ChangeNotifier {
  AuthStatus? status;
  FirebaseAuth? _auth;
  User? user;
  static AuthProvider instance = AuthProvider();

  AuthProvider() {
    _auth = FirebaseAuth.instance;
  }

  Future<void> loginUserwithEmailandPassword(
      String _email, String _password) async {
    status = AuthStatus.authenticating;
    notifyListeners();
    try {
      UserCredential? _result = await _auth?.signInWithEmailAndPassword(
          email: _email, password: _password);
      user = _result!.user as User?;
      status = AuthStatus.authenticated;
      //navigate to homepage
      SnackbarService.instance.showSnackbarSuccess("Welcome! ${user?.email}");
      // print("Logged in successfully");
    } catch (e) {
      SnackbarService.instance.showSnackbarError("Error Logging in!");
      status = AuthStatus.error;
    }

    notifyListeners();
  }

  void registerUserwithEmailandPassword(String _email, String _password,
      Future<void> onSuccess(String _uid)) async {
    status = AuthStatus.authenticating;
    try {
      UserCredential? _result = await _auth?.createUserWithEmailAndPassword(
          email: _email, password: _password);
      user = _result?.user;
      status = AuthStatus.authenticated;
      await onSuccess(user!.uid);
      SnackbarService.instance
          .showSnackbarSuccess("Registration Completed. Welcome ${_email}");
          //update last seen time
      NavigationService.instance.goBack();
      //navigate back to homepapge to login again after register
    } catch (e) {
      status = AuthStatus.error;
      user = null;
      SnackbarService.instance.showSnackbarError("Error Registering User!");
    }
    notifyListeners();
  }
}
