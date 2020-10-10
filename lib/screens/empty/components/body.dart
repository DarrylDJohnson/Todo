import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/blocs/todo/todo_cubit.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListTile(
        title: Text("No current todos"),
        subtitle: Text("click here to create a new todo"),
        onTap: () => context.bloc<TodoCubit>().goToCreateList(),
      ),
    );
  }
}
