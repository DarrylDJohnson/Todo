import 'package:todo/model/todo.dart';

class TodoList {
  final String id;
  final String title;
  final List<Todo> todos;
  final List<Todo> completed;

  TodoList({
    this.id,
    this.title,
    this.todos,
    this.completed,
  });

  TodoList.fromMap(Map<dynamic, dynamic> map)
      :
        this.id = map['id'],
        this.title = map['title'],
        this.todos = todosFromMap(map['todos']),
        this.completed = todosFromMap(map['completed']);
}
List<Todo> todosFromMap( dynamic d){
  
  List<Todo> todos = [];
  
  if(d != null && d is Map<dynamic, dynamic>){

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
