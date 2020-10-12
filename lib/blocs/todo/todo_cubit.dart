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
      List<TodoList> todoLists = await _todoRepository.streamLists().first;

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

  goToUpdateTodo(Todo todo) => emit(TodoStatePushTodo(todo: todo));

  goToUpdateList(TodoList todoList) => emit(TodoStateUpdateList(todoList));

  goToList({String id}) async =>
      emit(TodoStateSuccess(id ?? await _todoRepository.currentId));
}

extension TodoExtension on TodoCubit {
  pushTodo(Todo todo) async {
    _todoRepository.pushTodo(todo);
    goToList();
  }

  deleteTodo(Todo todo) async {
    _todoRepository.deleteTodo(todo);
    goToList();
  }
}

extension ListExtension on TodoCubit {
  createList(String title) async {
    String id = await _todoRepository.generateListId();

    await _todoRepository.createList(id, title);

    goToList(id: id);
  }

  updateList(TodoList todoList) async {
    await _todoRepository.updateList(todoList);

    goToList();
  }

  void clearList(TodoList todoList) async {
    await _todoRepository.clearList(todoList);

    goToList();
  }

  deleteList(TodoList todoList) async {
    await _todoRepository.deleteList(todoList);
    load();
  }
}

extension StreamExtension on TodoCubit {
  Stream<List<TodoList>> streamTodos() => _todoRepository.streamLists();

  Stream<TodoList> streamTodo() async* {
    yield* _todoRepository.streamList(await _todoRepository.currentId);
  }
}
