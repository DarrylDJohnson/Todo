import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/model/todo_list.dart';
import 'package:todo/repositories/todo_repository.dart';

import 'todo_state.dart';

export 'package:todo/model/todo.dart';

export 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoRepository _todoRepository;

  TodoCubit({TodoRepository todoRepository})
      : _todoRepository = todoRepository ?? TodoRepository(),
        super(TodoStateLoading());


  load() async {
    emit(TodoStateLoading());

    try {
      List<TodoList> todoLists = await _todoRepository.streamTodoLists().first;

      String id = await _todoRepository.getSharedPreferences("id");

      if (todoLists.isEmpty) {
        emit(TodoStateEmpty());
      } else if (id != null && todoLists.containsTodoWithId(id)) {
        emit(TodoStateSuccess(id));
      } else {
        emit(TodoStateSuccess(todoLists[0].id));
      }
    } catch (e) {
      emit(TodoStateError(e.toString()));
    }
  }

  create() async {
    try {
      String id = await _todoRepository.newTodoListId();

      emit(TodoStateCreate(
        onComplete: (title) => _todoRepository.createTodoList(id, title),
      ));

      emit(TodoStateSuccess(id));
    } catch (e) {
      emit(TodoStateError(e.toString()));
    }
  }

  add() async {
    try {
      emit(TodoStateAdd(
        onComplete: (title) => _todoRepository.addTodo(Todo(title: title)),
      ));

      emit(TodoStateSuccess(await _todoRepository.currentId));
    } catch (e) {
      emit(TodoStateError(e.toString()));
    }
  }

  update() async {
    emit(TodoStateUpdate());
  }

  goToTodo(String id) async => emit(TodoStateSuccess(id));
}

extension CRUDExtension on TodoCubit {

  add(Todo todo) {
    _todoRepository.addTodo(todo);
  }

  complete(Todo todo) async {
    _todoRepository.removeTodo(todo);
    _todoRepository.completeTodo(todo);
  }

  undoComplete(Todo todo) async {
    _todoRepository.removeCompleted(todo);
    _todoRepository.addTodo(todo);
  }
}

extension StreamExtension on TodoCubit {
  Stream<List<TodoList>> streamTodos() => _todoRepository.streamTodoLists();

  Stream<TodoList> streamTodo(String id) => _todoRepository.streamTodoList(id);
}