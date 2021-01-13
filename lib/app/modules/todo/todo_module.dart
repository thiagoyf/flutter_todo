import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/app/modules/todo/repositories/todo_firebase_firestore_repository.dart';
import 'todo_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'todo_page.dart';

class TodoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $TodoController,
        $TodoFirebaseFirestoreRepository,
        Bind<FirebaseFirestore>((inject) => FirebaseFirestore.instance),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => TodoPage()),
      ];

  static Inject get to => Inject<TodoModule>.of();
}
