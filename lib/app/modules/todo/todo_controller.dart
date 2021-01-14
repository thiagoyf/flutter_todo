import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo/app/modules/todo/models/todo_model.dart';
import 'package:todo/app/modules/todo/repositories/itodo_repository.dart';

part 'todo_controller.g.dart';

@Injectable()
class TodoController = _TodoControllerBase with _$TodoController;

abstract class _TodoControllerBase with Store {
  ITodoRepository _repository;

  _TodoControllerBase(this._repository);

  @observable
  ObservableStream<List<TodoModel>> todos;

  @action
  fetchAll() {
    todos = _repository.fetchAll().asObservable();
  }

  @action
  todoCompletedValue(TodoModel todo, bool completed) {
    todo.completed = completed;
    _repository.save(todo);
  }

  @action
  delete(TodoModel todo) {
    _repository.delete(todo);
  }
}
