// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_create_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $TodoCreateController = BindInject(
  (i) => TodoCreateController(i<ITodoRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoCreateController on _TodoCreateControllerBase, Store {
  final _$titleAtom = Atom(name: '_TodoCreateControllerBase.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$_TodoCreateControllerBaseActionController =
      ActionController(name: '_TodoCreateControllerBase');

  @override
  String validateTitle(String value) {
    final _$actionInfo = _$_TodoCreateControllerBaseActionController
        .startAction(name: '_TodoCreateControllerBase.validateTitle');
    try {
      return super.validateTitle(value);
    } finally {
      _$_TodoCreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic save() {
    final _$actionInfo = _$_TodoCreateControllerBaseActionController
        .startAction(name: '_TodoCreateControllerBase.save');
    try {
      return super.save();
    } finally {
      _$_TodoCreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title}
    ''';
  }
}
