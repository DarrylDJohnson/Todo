import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:todo/blocs/todo/todo_cubit.dart';

class TodoTile extends StatelessWidget {
  final Todo todo;

  TodoTile({
    Key key,
    this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        icon: Icon(MdiIcons.circleOutline),
        onPressed: () => context.bloc<TodoCubit>().pushTodo(todo.asCompleted()),
      ),
      title: Text(todo.title),
      onTap: () => context.bloc<TodoCubit>().goToUpdateTodo(todo),
    );
  }
}
