class Todo {
  final String id;
  final String title;
  final bool completed;

  Todo({
    this.id,
    this.title,
    this.completed,
  });

  Todo.fromMap(Map<dynamic, dynamic> map)
      : id = map['id'],
        title = map['title'],
        completed = map['completed'];

  Todo asCompleted() => Todo(id: id, title: title, completed: true);

  Todo asIncompleted() => Todo(id:id, title: title, completed: false);
}