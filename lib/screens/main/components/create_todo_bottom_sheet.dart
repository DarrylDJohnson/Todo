import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:todo/blocs/todo/todo_cubit.dart';
import 'package:todo/screens/components/action_tile.dart';
import 'package:todo/screens/main/components/borderless_text_field.dart';

createTodoBottomSheet(BuildContext context) => showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8.0),
        ),
      ),
      builder: (_) => CreateTodoBottomSheet(
        cubit: context.bloc<TodoCubit>(),
      ),
    );

class CreateTodoBottomSheet extends StatelessWidget {
  final TodoCubit cubit;

  const CreateTodoBottomSheet({Key key, this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = '';
    String description = '';

    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: ListView(
        shrinkWrap: true,
        children: [
          BorderlessTextField(
            hintText: 'new todo',
            onChange: (text) => title = text,
            trailing: IconButton(
              icon: Icon(MdiIcons.check),
              onPressed: () {
                cubit.pushTodo(Todo(title: title, description: description));
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
