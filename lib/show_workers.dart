import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixatease_user/services/database.dart';
import 'package:flutter/material.dart';
import 'package:fixatease_user/assets/worker_icons.dart';
import 'get_worker_details.dart';
import 'models/worker_types.dart';

class ShowWorkers extends StatefulWidget {
  const ShowWorkers({Key? key}) : super(key: key);

  @override
  _ShowWorkersState createState() => _ShowWorkersState();
}

class _ShowWorkersState extends State<ShowWorkers> {
  Stream<List<DocumentSnapshot<Map<String, dynamic>>>> workerStream = Stream.empty();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          toolbarHeight: 30,
          bottom: TabBar(
              tabs: workerTypes
                  .map((e) => Tab(icon: e.workerIcon, text: e.workerTitle))
                  .toList()),
          title: Text('Pick a Service'),
          centerTitle: true,
        ),
        drawer: Drawer(
          elevation: 10,
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text("Booking Status"),
                onTap: () => {Navigator.pushNamed(context, "/booking_status")},
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            GetWorkerDetails(
              designation: 'Electrician',
            ),
            GetWorkerDetails(
              designation: 'Carpenter',
            ),
            GetWorkerDetails(
              designation: 'Plumber',
            ),
          ],
        ),
      ),
    );
  }

//    getUsersList() {
//     return StreamBuilder<QuerySnapshot>(
//         stream: workerStream,
//         builder: (context, snapshot) {
//           if (!snapshot.hasData ||
//               snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           return ListView(
//               children: (snapshot.data)!.docs.map((document) {
//             return Container(
//               child: Text(document["UserName"]),
//             );
//           }).toList());
//         });
//   }
}
