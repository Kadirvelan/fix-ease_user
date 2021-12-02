import 'package:flutter/material.dart';
import 'package:fixatease_user/assets/worker_icons.dart';

import 'models/worker_types.dart';

class ShowWorkers extends StatefulWidget {
  const ShowWorkers({Key? key}) : super(key: key);

  @override
  _ShowWorkersState createState() => _ShowWorkersState();
}

class _ShowWorkersState extends State<ShowWorkers> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 0,
          bottom: TabBar(
              tabs: workerTypes
                  .map((e) => Tab(icon: e.workerIcon, text: e.workerTitle))
                  .toList()),
          title: Text('Pick a Service'),
          centerTitle: true,
        ),
        body: const TabBarView(
          children: [
            Icon(WorkerIcons.electrician_svgrepo_com__1_, size: 350),
            Icon(WorkerIcons.carpenter_svgrepo_com, size: 350),
            Icon(WorkerIcons.plumber_svgrepo_com, size: 350),
          ],
        ),
      ),
    );
  }
}
