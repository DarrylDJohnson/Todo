import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/blocs/todo/todo_cubit.dart';
import 'package:todo/model/todo_list.dart';

class Header extends StatelessWidget {
  final TodoList todoList;

  const Header({
    Key key,
    this.todoList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListTile(
        leading: Icon(null),
        title: Text(
          todoList.title,
          style: Theme.of(context).textTheme.headline4.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
        ),
        onTap: () => context.bloc<TodoCubit>().goToUpdateList(todoList),
      ),
    );
  }
}
