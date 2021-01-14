import 'package:todo/app/modules/todo/models/todo_model.dart';

abstract class ITodoRepository {
  Stream<List<TodoModel>> fetchAll();

  Future save(TodoModel todo);

  Future delete(TodoModel todo);
}
