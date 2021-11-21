import 'package:fixatease_user/register_screen.dart';
import 'package:fixatease_user/register_details.dart';
import 'package:fixatease_user/splash_screen.dart';
import 'package:flutter/material.dart';
import '/splash_screen.dart';
import '/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fix@ease',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        "/": (context) => splash_screen(),
        "/login": (context) => LoginScreen(),
        "/register": (context) => RegisterScreen(),
        "/register_details": (context) => RegisterDetails(),
      },
    );
  }
}
