import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tri_nethra/models/user.dart';
import 'package:tri_nethra/services/database.dart';

class CurrentUser extends ChangeNotifier {
  OurUser _currentUser = OurUser();
  OurUser get getCurrentUser => _currentUser;
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<String> signUpUser(String email, String password, String docType,
      String docNumber, String mobile, String pass, String lname) async {
    String retVal = "error";
    OurUser _user = OurUser();
    try {
      AuthResult _authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _user.uid = _authResult.user.uid;
      _user.email = _authResult.user.email;
      _user.docType = docType;
      _user.docNumber = docNumber;
      _user.mobile = mobile;
      _user.password = pass;
      _user.legalname = lname;
      String _returnString = await OurDatabase().createUser(_user);
      if (_returnString == "success") {
        retVal = "success";
      }
      // if (_authResult != null) {
      //   retVal = true;
      // }
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> signOut() async {
    String retVal = "error";
    try {
      await _auth.signOut();
      _currentUser = OurUser();
      retVal = "success";
    } catch (e) {
      print(e);
      retVal = e.message;
    }
    return retVal;
  }

  Future<String> onStartUp() async {
    String retVal = "error";
    try {
      FirebaseUser _firebaseUser = await _auth.currentUser();
      _currentUser.uid = _firebaseUser.uid;
      _currentUser.email = _firebaseUser.email;
      retVal = "Success";
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> loginUser(String email, String password) async {
    String retVal = "error";
    try {
      AuthResult _authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      _currentUser.uid = _authResult.user.uid;
      _currentUser.email = _authResult.user.email;
      retVal = "success";
    } catch (e) {
      print(e);
      retVal = e.message;
    }
    return retVal;
  }
}
