import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:todo/blocs/todo/todo_cubit.dart';
import 'package:todo/screens/components/action_tile.dart';

import 'borderless_text_field.dart';

createListBottomSheet(BuildContext context) => showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8.0),
        ),
      ),
      builder: (_) => CreateListBottomSheet(cubit: context.bloc<TodoCubit>()),
    );

class CreateListBottomSheet extends StatelessWidget {
  final TodoCubit cubit;

  const CreateListBottomSheet({
    Key key,
    this.cubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = '';

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: ListView(
        shrinkWrap: true,
        children: [
          BorderlessTextField(
            hintText: 'new todo list',
            onChange: (text) => title = text,
            trailing: IconButton(
              icon: Icon(MdiIcons.check),
              onPressed: () {
                cubit.createList(title);
                Navigator.of(context).pop(this);
              },
            ),
          ),
        ],
      ),
    );
  }
}
