import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/todo_model.dart';
import '../repositories/todo_firebase_firestore_repository.dart';

import 'todo_create_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'todo_create_page.dart';

class TodoCreateModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $TodoCreateController,
        $TodoFirebaseFirestoreRepository,
        Bind<FirebaseFirestore>((inject) => FirebaseFirestore.instance),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (_, args) => args.data == null
              ? TodoCreatePage(todoModel: TodoModel())
              : TodoCreatePage(
                  todoModel: args.data,
                  title: "Update",
                ),
        ),
      ];

  static Inject get to => Inject<TodoCreateModule>.of();
}
