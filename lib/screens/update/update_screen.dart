import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:todo/blocs/todo/todo_cubit.dart';

import 'components/body.dart';

class UpdateScreen extends StatelessWidget {
  final Todo todo;

  const UpdateScreen({
    Key key,
    this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.black),
        leading: IconButton(
          icon: Icon(MdiIcons.arrowLeft),
          onPressed: () => context.bloc<TodoCubit>().goToList(),
        ),
        actions: [
          IconButton(
            icon: Icon(MdiIcons.trashCan),
            onPressed: () => context.bloc<TodoCubit>().deleteTodo(todo),
          )
        ],
      ),
      body: Body(todo: todo),
    );
  }
}
