import 'package:flutter/material.dart';
import 'package:todo/blocs/todo/todo_cubit.dart';

import 'completed_todo_tile.dart';

class CompletedTodoSliver extends StatelessWidget {
  final List<Todo> todos;

  CompletedTodoSliver({
    Key key,
    @required this.todos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: todos.length == 0
          ? Container()
          : Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
              ),
              child: ExpansionTile(
                childrenPadding: EdgeInsets.only(left: 8.0),
                title: Text(
                  "Completed (${todos.length})",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                children: List.generate(
                  todos.length,
                  (index) => CompletedTodoTile(todo: todos[index]),
                ),
              ),
            ),
    );
  }
}
