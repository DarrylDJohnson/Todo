import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:todo/blocs/todo/todo_cubit.dart';

class TodoFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.grey.shade900,
      foregroundColor: Colors.white,
      child: Icon(MdiIcons.plus),
      onPressed: () => context.bloc<TodoCubit>().add(),
    );
  }
}
