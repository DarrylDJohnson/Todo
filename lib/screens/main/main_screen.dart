import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/blocs/todo/todo_cubit.dart';
import 'package:todo/screens/empty/empty_screen.dart';
import 'package:todo/screens/loading/loading_screen.dart';
import 'package:todo/screens/main/components/todo_bottom_sheet.dart';
import 'package:todo/screens/todo/todo_screen.dart';

import 'components/create_list_bottom_sheet.dart';
import 'components/create_todo_bottom_sheet.dart';
import 'components/update_list_bottom_sheet.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.bloc<TodoCubit>().load();
    return BlocListener(
      cubit: context.bloc<TodoCubit>(),
      listener: (context, state) {
        if (state is TodoStateCreateList) {
          createListBottomSheet(context);
        } else if (state is TodoStateCreateTodo) {
          todoBottomSheet(context, null);
        } else if (state is TodoStateUpdateList) {
          updateListBottomSheet(context, todoList: state.todoList);
        } else if (state is TodoStatePushTodo) {
          todoBottomSheet(context, state.todo);
        }
      },
      child: SafeArea(
        child: BlocBuilder(
          cubit: context.bloc<TodoCubit>(),
          builder: (context, state) {
            if (state is TodoStateLoading) {
              return LoadingScreen();
            } else if (state is TodoStateEmpty) {
              return EmptyScreen();
            } else {
              return TodoScreen();
            }
          },
        ),
      ),
    );
  }
}
