import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo/app/modules/todo/models/todo_model.dart';

import 'itodo_repository.dart';

part 'todo_firebase_firestore_repository.g.dart';

@Injectable()
class TodoFirebaseFirestoreRepository extends Disposable
    implements ITodoRepository {
  final FirebaseFirestore _firestore;

  TodoFirebaseFirestoreRepository(this._firestore);

  @override
  Stream<List<TodoModel>> fetchAll() {
    return _firestore.collection("todo").snapshots().map((query) => query.docs
        .map((document) => TodoModel.fromDocument(document))
        .toList());
  }

  @override
  void save(TodoModel todo) {
    if (todo.reference == null) {
    } else {
      todo.reference.update({"title": todo.title, "completed": todo.completed});
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
