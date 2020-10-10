import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/blocs/todo/todo_cubit.dart';
import 'package:todo/model/todo_list.dart';

import 'completed_todo_sliver.dart';
import 'todo_app_bar.dart';
import 'todo_sliver.dart';

class Body extends StatelessWidget {
  final String id;

  const Body({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: context.bloc<TodoCubit>().streamTodo(id),
      builder: (context, snapshot) {
        TodoList todoList = snapshot.data;

        return CustomScrollView(
          slivers: todoList != null
              ? [
                  SliverPadding(padding: EdgeInsets.all(8.0)),
                  TodoAppBar(todoList: todoList),
                  TodoSliver(todos: todoList.todos),
                  SliverToBoxAdapter(
                    child: Divider(thickness: 1.0),
                  ),
                  CompletedTodoSliver(todos: todoList.completed),
                ]
              : [],
        );
      },
    );
  }
}
