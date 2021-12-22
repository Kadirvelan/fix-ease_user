import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixatease_user/services/auth_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


final FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

class DatabaseMethods {
  User? user = auth.currentUser;
  Future adduserInfoToDB(Map<String, dynamic> userInfoMap) async {
    return firestoreInstance
        .collection("users")
        .doc(user?.email)
        .set(userInfoMap);
  }

  Future cancelBooking(document) async {
    return firestoreInstance
        .collection("Appointments")
        .doc(document.id)
        .delete();
  }

  Future<Stream<QuerySnapshot>> getWorkersDetails() async {
    return firestoreInstance
        .collection("workers")
        .where("Designation", isEqualTo: "Electrician")
        .snapshots();
  }

  Future<Stream<QuerySnapshot>> getBookingDetails() async {
    return firestoreInstance
        .collection("Appointments")
        .where("UserMail", isEqualTo: user?.email)
        .orderBy("StartTime", descending: true)
        .snapshots();
  }

  Future bookWorker(
      Map<String, dynamic> bookWorkerDetails, BuildContext context) async {
    // firestoreInstance
    //     .collection("Appointments")
    //     .where("Status", isEqualTo: "Active")
    //     .where("WorkerMail", isEqualTo: bookWorkerDetails['WorkerMail'])
    //     // .where("StartTime",
    //     //     isGreaterThanOrEqualTo: bookWorkerDetails['StartTime'])
    //     .where(
    //       "EndTime",
    //       isGreaterThanOrEqualTo: bookWorkerDetails['StartTime'],
    //     )
    //     .get()
    //     .then((value) {
    //   print(value.size);
    //   if (value.size == 1) {
    //     print("Already booked");
    //     showDialog(
    //         context: context,
    //         builder: (BuildContext context) => (AlertDialog(
    //               title: Text("Already booked"),
    //             )));
    //   } else {
    print("booked");
    showDialog(
        context: context,
        builder: (BuildContext context) => (const AlertDialog(
              title:
                  Text("Appointment booked.Check Status for further Updates"),
            )));
    return firestoreInstance
        .collection("Appointments")
        .doc()
        .set(bookWorkerDetails);
  }
// });

// return firestoreInstance
//     .collection("Appointments")
//     .doc()
//     .set(bookWorkerDetails);
// }

//
// confirmDetails(BuildContext context,Map<String,dynamic> userInfoMap) async {
//   adduserInfoToDB(userInfoMap);
// }
// }
}
