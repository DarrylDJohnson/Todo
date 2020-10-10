import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/blocs/todo/todo_cubit.dart';
import 'package:todo/screens/components/bottom_bar.dart';

class EmptyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Nothing left todo but smile.",
            style: Theme.of(context).textTheme.headline3,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
          ),
          RaisedButton(
            color: Colors.white,
            child: Text('Start a new todo list'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            onPressed: () => context.bloc<TodoCubit>().goToCreateList(),
          )
        ],
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
