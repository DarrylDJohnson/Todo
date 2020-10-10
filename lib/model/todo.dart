class Todo {
  final String id;
  final String title;

  Todo({
    this.id,
    this.title,
  });

  Todo.fromMap(Map<dynamic, dynamic> map)
      : id = map['id'],
        title = map['title'];
}