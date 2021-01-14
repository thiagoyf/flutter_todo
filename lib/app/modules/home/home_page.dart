import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo/app/routes/todo_routes.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var todo = await Modular.to.pushNamed(TodoRoutes.todo) as String;
          if (todo != null) controller.addTodo(todo);
        },
        child: Icon(Icons.add),
      ),
      body: Observer(
        builder: (_) {
          List<String> todos = controller.todos;
          return ListView.builder(
          itemCount: todos.length,
          itemBuilder: (_, index) => ListTile(
            title: Text(todos[index]),
          ),
        );
        }
      ),
    );
  }
}
