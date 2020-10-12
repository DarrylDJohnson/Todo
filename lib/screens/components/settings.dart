import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/blocs/todo/todo_cubit.dart';

settings(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (_) => Settings(
      todoCubit: context.bloc<TodoCubit>(),
    ),
  );
}

class Settings extends StatelessWidget {
  final TodoCubit todoCubit;

  const Settings({Key key, @required this.todoCubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          title: Text("Sort by"),
        ),
        Divider(),
        ListTile(
          title: Text("Rename scoreboard"),
        ),
        ListTile(
          title: Text("Delete scoreboard"),
        ),
        ListTile(
          title: Text("Clear players"),
        ),
      ],
    );
  }
}
