import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixatease_user/services/auth_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:fixatease_user/pick_location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

class DatabaseMethods {
  User? user = auth.currentUser;
  late LatLng markerLatLong =LatLng(13.010651, 80.2331943);


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

  Future<Stream<List<DocumentSnapshot<Map<String, dynamic>>>>>
      getWorkerDetailsByLocation(String designation) async {
    getPosition();
    final geo = Geoflutterfire();
    GeoFirePoint center = geo.point(
        latitude: markerLatLong.latitude, longitude: markerLatLong.longitude);
    final _firestore = FirebaseFirestore.instance;
    var collectionReference = await _firestore.collection('workers').where("Designation",isEqualTo: designation);
    double radius = 10;
    String field = 'Location';

    return await geo
        .collection(collectionRef: collectionReference)
        .within(center: center, radius: radius, field: field);
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

  getPosition() {
    getUserLocation().then((value) {
      print('Map Co-ordinates');
      print(value);
      markerLatLong = LatLng(value.latitude, value.longitude);
    });
  }

  Future<Position> getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
