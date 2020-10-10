import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:todo/blocs/todo/todo_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/body.dart';

class UpdateScreen extends StatelessWidget {
  final Todo todo;

  const UpdateScreen({Key key, this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(MdiIcons.arrowLeft),
          onPressed: context.bloc<TodoCubit>().goToTodo(),
        ),
        actions: [
          IconButton(
            icon: Icon(MdiIcons.trashCan),
          )
        ],
      ),
      body: Body(),
    );
  }
}
