import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todo/model/todo.dart';

@immutable
abstract class TodoState extends Equatable {
  TodoState([List props = const []]) : super(props);
}

class TodoStateCreateList extends TodoState {
  @override
  String toString() => 'Create List';
}

class TodoStateCreateTodo extends TodoState {
  @override
  String toString() => 'Create Todo';
}

class TodoStateUpdate extends TodoState {
  final Todo todo;

  TodoStateUpdate({this.todo}) : super([todo]);

  @override
  String toString() => 'Update Todo : ${todo.id}';
}

class TodoStateLoading extends TodoState {
  @override
  String toString() => 'Todo Loading';
}

class TodoStateSuccess extends TodoState {
  final String id;

  TodoStateSuccess(this.id) : super([id]);

  @override
  String toString() => 'Todo Success: $id';
}

class TodoStateEmpty extends TodoState {
  @override
  String toString() => 'Todo Empty';
}

class TodoStateError extends TodoState {
  final String error;

  TodoStateError(this.error) : super([error]);

  @override
  String toString() => 'Todo Error: $error';
}
