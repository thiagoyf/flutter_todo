import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo/app/modules/todo/models/todo_model.dart';
import 'package:todo/app/routes/todo_routes.dart';
import 'package:todo/app/shared/colors/custom_colors.dart';
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () =>
            Modular.to.pushNamed("${TodoRoutes.todo}${TodoRoutes.todo_create}"),
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
            itemBuilder: (_, index) => ListTile(
              title: Text(todos[index].title),
              leading: Checkbox(
                value: todos[index].completed,
                onChanged: (value) {
                  controller.todoCompletedValue(todos[index], value);
                },
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.delete_forever,
                  color: CustomColors.deleteIconColor,
                ),
                onPressed: () {
                  controller.delete(todos[index]);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
