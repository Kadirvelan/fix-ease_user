import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixatease_user/services/database.dart';
import 'package:flutter/material.dart';

class GetWorkerDetails extends StatefulWidget {
  @override
  State<GetWorkerDetails> createState() => _GetWorkerDetailsState();
}

class _GetWorkerDetailsState extends State<GetWorkerDetails> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    // if (timeOfDay != null && timeOfDay != selectedTime) {
    setState(() {
      selectedTime = timeOfDay!;
      print(selectedTime);
      // selectedDate= ;
    });
    // }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    // if (picked != null && picked != selectedDate) {
    print(selectedDate);
    _selectTime(context);
    setState(() {
      selectedDate = picked!;
      // });
    });
  }

  Stream<QuerySnapshot> workerStream = Stream.empty();

  getWorkerDetails() async {
    workerStream = await DatabaseMethods().getWorkersDetails();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWorkerDetails();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: workerStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData ||
              snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
              children: (snapshot.data)!.docs.map((document) {
            return Container(
              width: 100,
              height: 100,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.red,
                elevation: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Row(
                        children: [
                          Text(
                            document["UserName"],
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            document["Mobile Number"],
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                              onPressed: () => {}, child: Text("Book Now")),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                              onPressed: () => _selectDate(context),
                              child: const Text("schedule")),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(document["Address"]),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }).toList());
        });
    ;
  }
}
