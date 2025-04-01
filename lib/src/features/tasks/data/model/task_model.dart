import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  String? id;
  String? title;
  String? description;
  String? status;
  int? dueDate;

  TaskModel({this.id, this.title, this.description, this.status, this.dueDate});

  factory TaskModel.fromFirestore(DocumentSnapshot snapshot) {
    try {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      return TaskModel(
        id: snapshot.id,
        title: data['title'],
        description: data['description'],
        dueDate: data['due_date'],
        status: data['status'],
      );
    } catch (e, s) {
      log("TaskModel.fromFire store", error: e, stackTrace: s);
      return TaskModel();
    }
  }
}
