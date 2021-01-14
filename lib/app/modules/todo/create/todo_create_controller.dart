import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../repositories/itodo_repository.dart';
import '../models/todo_model.dart';

part 'todo_create_controller.g.dart';

@Injectable()
class TodoCreateController = _TodoCreateControllerBase
    with _$TodoCreateController;

abstract class _TodoCreateControllerBase with Store {
  final ITodoRepository _repository;
  TodoModel _todo;

  _TodoCreateControllerBase(this._repository);

  @observable
  String title = "";

  set todo(TodoModel todo) {
    _todo = todo;
    title = todo.title;
  }

  @action
  String validateTitle(String value) =>
      value.isEmpty ? 'Please enter some text' : null;

  @action
  save() {
    _todo.title = title;
    _repository.save(_todo);
  }
}
