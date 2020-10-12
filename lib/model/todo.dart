class Todo {
  final String id;
  String title;
  String description;
  bool completed;

  Todo({
    this.id,
    this.title,
    this.description,
    this.completed,
  });

  Todo.fromMap(Map<dynamic, dynamic> map)
      : id = map['id'],
        title = map['title'],
        description = map['description'],
        completed = map['completed'];

  Todo copyWith({String title, String description, bool completed}) => Todo(
        id: id,
        title: title ?? this.title,
        description: description ?? this.description,
        completed: completed ?? this.completed,
      );
}
