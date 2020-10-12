import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:todo/blocs/todo/todo_cubit.dart';
import 'package:todo/screens/components/action_tile.dart';
import 'package:todo/screens/main/components/borderless_text_field.dart';

todoBottomSheet(BuildContext context, Todo todo) => showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8.0),
        ),
      ),
      builder: (_) => TodoBottomSheet(
        cubit: context.bloc<TodoCubit>(),
        todo: todo,
      ),
    );

class TodoBottomSheet extends StatelessWidget {
  final TodoCubit cubit;
  final Todo todo;

  const TodoBottomSheet({
    Key key,
    this.cubit,
    this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = todo.title ?? '';
    String description = todo.description ?? '';

    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: ListView(
        shrinkWrap: true,
        children: [
          BorderlessTextField(
            hintText: 'new todo',
            onChange: (text) => title = text,
            initialText: todo.title,
            trailing: IconButton(
              icon: Icon(MdiIcons.check),
              onPressed: () {
                cubit.pushTodo(todo.copyWith(title: title, description: description));
                Navigator.of(context).pop(this);
              },
            ),
          ),
          ActionTile.custom(
            icon: MdiIcons.sortVariant,
            child: BorderlessTextField(
              padding: 0.0,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.black54,
              ),
              initialText: todo.description,
              hintText: 'description',
              onChange: (text) => description = text,
            ),
          ),
          ActionTile(
            icon: MdiIcons.calendarOutline,
            title: 'todo date',
          ),
        ],
      ),
    );
  }
}
