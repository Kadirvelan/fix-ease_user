import 'package:fixatease_user/assets/worker_icons.dart';
import 'package:flutter/material.dart';

List<WorkerTypes> workerTypes = <WorkerTypes>[
  WorkerTypes("Electrician", Icon(WorkerIcons.electrician_svgrepo_com__1_)),
  WorkerTypes("Carpenter", Icon(WorkerIcons.carpenter_svgrepo_com)),
  WorkerTypes("Plumber", Icon(WorkerIcons.plumber_svgrepo_com)),
];

class WorkerTypes {
  final String workerTitle;
  final Icon workerIcon;
  WorkerTypes(this.workerTitle, this.workerIcon);
}
