import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:todo/blocs/todo/todo_cubit.dart';
import 'package:todo/model/todo_list.dart';

import 'file:///C:/Users/Darry/AndroidStudioProjects/todo/lib/screens/components/action_tile.dart';

import 'borderless_text_field.dart';

updateListBottomSheet(BuildContext context, {@required TodoList todoList}) =>
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8.0),
        ),
      ),
      builder: (_) => UpdateListBottomSheet(
        cubit: context.bloc<TodoCubit>(),
        todoList: todoList,
      ),
    );

class UpdateListBottomSheet extends StatelessWidget {
  final TodoCubit cubit;
  final TodoList todoList;

  const UpdateListBottomSheet({
    Key key,
    this.cubit,
    this.todoList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: WillPopScope(
        onWillPop: () async {
          cubit.updateList(todoList);
          return true;
        },
        child: ListView(
          shrinkWrap: true,
          children: [
            BorderlessTextField(
              initialText: todoList.title,
              hintText: 'List title',
              onChange: (text) => todoList.title = text,
              trailing: IconButton(
                icon: Icon(MdiIcons.close),
                onPressed: () => Navigator.of(context).pop(this),
              ),
            ),
            Divider(
              thickness: 1.5,
            ),
            ActionTile(
              icon: MdiIcons.deleteSweepOutline,
              title: 'Clear completed',
              onPressed: () => cubit.clearList(todoList),
            ),
            ActionTile(
              icon: MdiIcons.shareOutline,
              title: 'Share',
            ),
            ActionTile(
              icon: MdiIcons.closeCircleOutline,
              title: 'Delete',
              onPressed: () => cubit.deleteList(todoList),
            ),
          ],
        ),
      ),
    );
  }
}
