import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:todo/blocs/todo/todo_cubit.dart';

class CompletedTodoTile extends StatelessWidget {
  final Todo todo;

  const CompletedTodoTile({Key key, this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: IconButton(
        icon: Icon(MdiIcons.check),
        onPressed: () => context.bloc<TodoCubit>().pushTodo(todo.asIncompleted()),
      ),
      title: Text(
        todo.title,
        style: TextStyle(decoration: TextDecoration.lineThrough),
      ),
      onTap: () => context.bloc<TodoCubit>().goToUpdateTodo(todo),
    );
  }
}
