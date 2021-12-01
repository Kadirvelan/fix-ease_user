import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixatease_user/services/auth_helper.dart';
import 'package:flutter/cupertino.dart';

User? user = auth.currentUser;

class DatabaseMethods {
  Future adduserInfoToDB(Map<String, dynamic> userInfoMap) async {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(user?.email)
        .set(userInfoMap);
  }
  //
  // confirmDetails(BuildContext context,Map<String,dynamic> userInfoMap) async {
  //   adduserInfoToDB(userInfoMap);
  // }

}
