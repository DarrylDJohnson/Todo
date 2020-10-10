import 'dart:async';

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

  goToCreateList() => emit(TodoStateCreateList());

  goToCreateTodo() => emit(TodoStateCreateTodo());

  goToUpdateTodo() async {
    emit(TodoStateUpdate());
  }

  goToTodo({String id}) async =>
      emit(TodoStateSuccess(id ?? await _todoRepository.currentId));
}

extension CRUDExtension on TodoCubit {
  createTodo(Todo todo) async {
    _todoRepository.createTodo(todo);
    goToTodo();
  }

  createList(String title) async {
    String id = await _todoRepository.generateListId();

    await _todoRepository.createList(id, title);

    goToTodo(id: id);
  }

  complete(Todo todo) async {
    _todoRepository.removeTodo(todo);
    _todoRepository.completeTodo(todo);
  }

  undoComplete(Todo todo) async {
    _todoRepository.removeCompleted(todo);
    _todoRepository.createTodo(todo);
  }
}

extension StreamExtension on TodoCubit {
  Stream<List<TodoList>> streamTodos() => _todoRepository.streamTodoLists();

  Stream<TodoList> streamTodo(String id) => _todoRepository.streamTodoList(id);
}
