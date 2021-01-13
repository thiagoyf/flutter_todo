import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo/app/modules/todo/models/todo_model.dart';
import 'todo_controller.dart';

class TodoPage extends StatefulWidget {
  final String title;
  const TodoPage({Key key, this.title = "Todo"}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends ModularState<TodoPage, TodoController> {
  @override
  void initState() {
    super.initState();
    controller.fetchAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (_) {
          if (controller.todos.hasError) {
            return Center(
              child: RaisedButton(
                onPressed: controller.fetchAll(),
                child: Text('Reload'),
              ),
            );
          }

          List<TodoModel> todos = controller.todos.data;

          if (todos == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (_, index) => CheckboxListTile(
              title: Text(todos[index].title),
              value: todos[index].completed,
              onChanged: (value) {
                todos[index].completed = value;
                controller.save(todos[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
