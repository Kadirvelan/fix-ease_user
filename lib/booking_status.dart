import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixatease_user/services/database.dart';
import 'package:flutter/material.dart';

class BookingStatus extends StatefulWidget {
  const BookingStatus({Key? key}) : super(key: key);

  @override
  _BookingStatusState createState() => _BookingStatusState();
}

class _BookingStatusState extends State<BookingStatus> {
  Stream<QuerySnapshot> bookingStream = Stream.empty();

  getBookingDetails() async {
    bookingStream = await DatabaseMethods().getBookingDetails();
    setState(() {
      bookingStream;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBookingDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking Status"),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: bookingStream,
          builder: (context, snapshot) {
            if (!snapshot.hasData ||
                snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
                children: (snapshot.data)!.docs.map((document) {
              print(document['UserMail']);
              return Container(
                width: 100,
                height: 104,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.red,
                  elevation: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Worker Mail : " + document['WorkerMail']),
                            Text("Time of Booking :" +
                                DateTime.parse(document['StartTime']
                                        .toDate()
                                        .toString())
                                    .toString()),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Status : " + document['Status']),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () => {
                                        DatabaseMethods()
                                            .cancelBooking(document)
                                      },
                                      child: Text("Cancel"),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList());
          }),
    );
  }
}
