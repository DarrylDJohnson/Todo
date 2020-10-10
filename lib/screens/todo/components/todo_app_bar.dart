import 'package:flutter/material.dart';
import 'package:todo/model/todo_list.dart';

class TodoAppBar extends StatelessWidget {

  final TodoList todoList;

  const TodoAppBar({
    Key key,
    this.todoList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: Icon(null),
      backgroundColor: Colors.transparent,
      title: Text(
        todoList.title,
        style: Theme.of(context).textTheme.headline4.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w300,
            ),
      ),
    );
  }
}
