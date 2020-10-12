import 'package:todo/model/todo.dart';

class TodoList {
  final String id;
  String title;
  final List<Todo> todos;

  TodoList({
    this.id,
    this.title,
    this.todos,
  });

  TodoList.fromMap(Map<dynamic, dynamic> map)
      : this.id = map['id'],
        this.title = map['title'],
        this.todos = todosFromMap(map['todos']);
}

List<Todo> todosFromMap(dynamic d) {
  List<Todo> todos = [];

  if (d != null && d is Map<dynamic, dynamic>) {
    Map<dynamic, dynamic> map = d;

    map.values.forEach((value) => todos.add(Todo.fromMap(value)));
  }

  return todos;
}

extension TodoExt on List<TodoList> {
  bool containsTodoWithId(String id) {
    this.forEach((todo) {
      if (todo.id == id) return true;
    });

    return false;
  }
}

extension TodoExtension on List<Todo> {
  List<Todo> completed() {
    return this.where((todo) => todo.completed == true).toList();
  }

  List<Todo> incompleted() {
    return this.where((todo) => todo.completed == false).toList();
  }
}
