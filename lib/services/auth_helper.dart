import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth auth = FirebaseAuth.instance;

String userMail = '';
String userPass = '';
String userPassConf = '';

displayDialog(BuildContext context, String text) {
  showDialog(
      context: context,
      builder: (BuildContext context) => (AlertDialog(
            title: Text(text),
          )));
}

signUp(BuildContext context) async {
  if (userPass == userPassConf) {
    print(userPassConf);
    print(userMail);
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: userMail, password: userPassConf);
      Navigator.pushNamed(context, '/login');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        displayDialog(context, 'The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  } else {
    displayDialog(context, 'Password doesn\'t match.');
  }
}

signIn(BuildContext context) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: userMail, password: userPass);
    if (userCredential != null) {
      await Navigator.pushNamed(context, '/register_details');
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
      displayDialog(context, 'No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
      displayDialog(context, 'Wrong password provided for that user.');
    }
  }
}
