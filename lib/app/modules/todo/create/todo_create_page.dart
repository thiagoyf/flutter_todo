import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo/app/modules/todo/models/todo_model.dart';
import 'package:todo/app/shared/dimens/custom_dimens.dart';

import 'todo_create_controller.dart';

class TodoCreatePage extends StatefulWidget {
  final String title;
  final TodoModel todoModel;

  const TodoCreatePage({Key key, this.todoModel, this.title = "Create"})
      : super(key: key);

  @override
  _TodoCreatePageState createState() => _TodoCreatePageState();
}

class _TodoCreatePageState
    extends ModularState<TodoCreatePage, TodoCreateController> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controller.todo = widget.todoModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(CustomDimens.defaultPadding),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Todo',
                  hintText: 'Type the todo title',
                ),
                validator: controller.validateTitle,
                initialValue: controller.title,
                onChanged: (value) => controller.title = value,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    controller.save();
                    Modular.to.pop();
                  }
                },
                child: Text('SAVE'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
