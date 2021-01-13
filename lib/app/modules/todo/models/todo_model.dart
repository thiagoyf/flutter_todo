import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  String title;
  bool completed;
  final DocumentReference reference;

  TodoModel({this.title, this.completed, this.reference});

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        title: json["title"],
        completed: json["completed"],
        reference: json["reference"]
      );

  factory TodoModel.fromDocument(DocumentSnapshot document) => TodoModel(
        title: document["title"],
        completed: document["completed"],
        reference: document.reference
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "completed": completed,
        "reference": reference,
      };
}
