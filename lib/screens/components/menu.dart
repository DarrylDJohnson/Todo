import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:todo/blocs/todo/todo_cubit.dart';
import 'package:todo/screens/components/action_tile.dart';

import 'todo_section.dart';

menu(BuildContext context) => showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8.0),
        ),
      ),
      builder: (_) => Menu(todoCubit: context.bloc<TodoCubit>()
      )
    );

class Menu extends StatelessWidget {

  final TodoCubit todoCubit;

  const Menu({Key key, this.todoCubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ListTile(title: Text("Menu")),
        Divider(),
        TodoSection(todoCubit: todoCubit),
        ActionTile(
          icon: MdiIcons.plus,
          title: 'New todo list',
          onPressed: () => todoCubit.goToCreateList(),
        ),
        Divider(),
        ActionTile(
          icon: MdiIcons.help,
          title: 'Help & Feedback',
        ),
      ],
    );
  }
}
