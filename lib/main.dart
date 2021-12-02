import 'package:fixatease_user/register_details.dart';
import 'package:fixatease_user/register_screen.dart';
import 'package:fixatease_user/pick_location.dart';
import 'package:fixatease_user/services/database.dart';
import 'package:fixatease_user/show_workers.dart';
import 'package:fixatease_user/splash_screen.dart';
import 'package:flutter/material.dart';
import '/splash_screen.dart';
import '/login_screen.dart';
//import 'package:fixatease_user/location_main.dart';
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
        "/": (context) => splash_screen(), //Database(),
        "/login": (context) => LoginScreen(),
        "/register": (context) => RegisterScreen(),
        "/pick_location": (context) => PickLocation(),
        '/register_details': (context) => RegisterDetails(), //LocationMain()
        '/show_workers': (context) => ShowWorkers(),
      },
    );
  }
}
