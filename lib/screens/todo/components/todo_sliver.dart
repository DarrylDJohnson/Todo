import 'package:flutter/material.dart';
import 'package:todo/blocs/todo/todo_cubit.dart';

import 'todo_tile.dart';

class TodoSliver extends StatelessWidget {
  final List<Todo> todos;

  TodoSliver({
    Key key,
    @required this.todos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => TodoTile(todo: todos[index]),
        childCount: todos.length,
      ),
    );
  }
}
