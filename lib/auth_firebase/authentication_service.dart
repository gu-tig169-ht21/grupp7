import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_first_app/main.dart';

class AuthenticationService {
  final FirebaseAuth firebaseAuth;

  AuthenticationService(this.firebaseAuth);

  Stream<User?> get authStateChanges => firebaseAuth.idTokenChanges();

  Future<String?> signIn(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      Fluttertoast.showToast(msg: "Successfully logged in ");
      return "Signed In";
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: 'Wrong password');
      print('error caught: $e');
      return e.message;
    }
  }

  Future<String?> signUp(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      Fluttertoast.showToast(msg: "Account Created");

      return "Account Created";
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: 'The email address is badly formatted');
      print('error caught: $e');

      return e.message;
    }
  }

/*
  Future<String?> signUp(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed Up";
    } on FirebaseAuthException catch (e) {
      print('error caught: $e');
      
      return e.message;
    }
  }

  */

  Future<void> signOut() async {
    await firebaseAuth.signOut();
    runApp(new MaterialApp(
      home: new AuthenticationWrapper(),
    ));
  }
}
