import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  String title;
  bool completed;
  final DocumentReference reference;

  TodoModel({this.title = "", this.completed = false, this.reference});

  factory TodoModel.fromDocument(DocumentSnapshot document) => TodoModel(
        title: document["title"],
        completed: document["completed"],
        reference: document.reference
      );
}
