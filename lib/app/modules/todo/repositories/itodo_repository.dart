import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo/app/modules/todo/models/todo_model.dart';

abstract class ITodoRepository {

  Stream<List<TodoModel>> fetchAll();

  void save(TodoModel todo);

}