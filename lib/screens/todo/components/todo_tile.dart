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

  bool get isComplete => todo.completed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: isComplete ? 8.0 : 16.0),
      leading: IconButton(
        icon: Icon(isComplete ? MdiIcons.check : MdiIcons.circleOutline),
        onPressed: () => context.bloc<TodoCubit>().pushTodo(
              todo.copyWith(completed: !isComplete),
            ),
      ),
      title: Text(
        todo.title,
        style: isComplete
            ? TextStyle(
                decoration: TextDecoration.lineThrough,
              )
            : null,
      ),
      onTap: () => context.bloc<TodoCubit>().goToUpdateTodo(todo),
    );
  }
}
