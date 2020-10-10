import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/model/todo_list.dart';

class TodoRepository {
  DatabaseReference get reference =>
      FirebaseDatabase.instance.reference().child('todos');

  Future<String> generateListId() async {
    return reference.push().key;
  }

  createList(String id, String title) async {
    await reference.child(id).set({
      'id': id,
      'title': title,
      'timestamp': DateTime.now().toString(),
      'todos': [],
      'completed': [],
    });
  }

  ///Todos
  pushTodo(Todo todo) async {
    String id =
        todo.id ?? reference.child(await currentId).child('todos').push().key;

    await reference.child(await currentId).child('todos').child(id).set({
      'id': id,
      'title': todo.title,
      'completed': todo.completed ?? false,
    });
  }

  deleteTodo(Todo todo) async => await reference
      .child(await currentId)
      .child('todos')
      .child(todo.id)
      .remove();

  deleteCompleted(Todo todo) async => await reference
      .child(await currentId)
      .child('completed')
      .child(todo.id)
      .remove();
}

extension StreamExtension on TodoRepository {
  Stream<List<TodoList>> streamLists() {
    return reference.onValue.transform(
      StreamTransformer.fromHandlers(
        handleData: (event, sink) => sink.add(event.toTodoLists()),
      ),
    );
  }

  Stream<TodoList> streamList(String id) {
    return reference.child(id).onValue.transform(
          StreamTransformer.fromHandlers(
            handleData: (event, sink) => sink.add(event.toTodoList()),
          ),
        );
  }
}

extension SharedPreferencesExtension on TodoRepository {
  Future<String> get currentId => getSharedPreferences('id');

  Future<String> getSharedPreferences(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  setSharedPreference(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }
}

extension EventExt on Event {
  List<TodoList> toTodoLists() {
    List<TodoList> todos = [];

    if (this != null && this.snapshot != null && this.snapshot.value != null) {
      Map<dynamic, dynamic> map = this.snapshot.value;

      map.values.forEach((value) => todos.add(TodoList.fromMap(value)));
    }

    return todos;
  }

  TodoList toTodoList() {
    if (this != null && this.snapshot != null && this.snapshot.value != null) {
      return TodoList.fromMap(this.snapshot.value);
    }

    return null;
  }
}
