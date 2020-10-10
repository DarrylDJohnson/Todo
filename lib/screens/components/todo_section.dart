import 'package:flutter/material.dart';
import 'package:todo/blocs/todo/todo_cubit.dart';
import 'package:todo/model/todo_list.dart';

class TodoSection extends StatelessWidget {
  final TodoCubit todoCubit;

  const TodoSection({Key key, this.todoCubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TodoList>>(
      stream: todoCubit.streamTodos(),
      builder: (context, snapshot) {
        List<TodoList> todos = snapshot.data ?? [];

        return ListView.builder(
          shrinkWrap: true,
          itemCount: todos.length,
          itemBuilder: (context, index) {
            TodoList todo = todos[index];
            return ListTile(
              title: Text(todos[index].title),
              onTap: () {
                print("onTap: ${todos[index].toString()}");
                todoCubit.goToTodo(todo.id);
                Navigator.of(context).pop(this);
              },
            );
          },
        );
      },
    );
  }
}
