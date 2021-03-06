import 'package:todo/app/modules/todo/create/todo_create_module.dart';
import 'package:todo/app/modules/todo/todo_module.dart';
import 'package:todo/app/routes/todo_routes.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:todo/app/app_widget.dart';
import 'package:todo/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [$AppController];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
        ModularRouter(TodoRoutes.todo, module: TodoModule()),
        ModularRouter("${TodoRoutes.todo}${TodoRoutes.todo_create}",
            module: TodoCreateModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
