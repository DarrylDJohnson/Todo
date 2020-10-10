import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/blocs/todo/todo_cubit.dart';
import 'package:todo/screens/empty/empty_screen.dart';
import 'package:todo/screens/loading/loading_screen.dart';
import 'package:todo/screens/todo/todo_screen.dart';
import 'package:todo/screens/update/update_screen.dart';

import 'components/create_list_bottom_sheet.dart';
import 'components/create_todo_bottom_sheet.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.bloc<TodoCubit>().load();
    return BlocListener(
      cubit: context.bloc<TodoCubit>(),
      listener: (context, state) {
        if (state is TodoStateCreateList) {
          createListBottomSheet(context: context);
        } else if (state is TodoStateCreateTodo) {
          createTodoBottomSheet(context: context);
        }
      },
      child: SafeArea(
        child: BlocBuilder(
          cubit: context.bloc<TodoCubit>(),
          builder: (context, state) {
            if (state is TodoStateSuccess) {
              return TodoScreen(id: state.id);
            } else if (state is TodoStateEmpty) {
              return EmptyScreen();
            } else if (state is TodoStateUpdate) {
              return UpdateScreen(todo: state.todo);
            } else {
              return LoadingScreen();
            }
          },
        ),
      ),
    );
  }
}
