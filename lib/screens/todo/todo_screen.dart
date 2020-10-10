import 'package:flutter/material.dart';
import 'package:todo/screens/components/bottom_bar.dart';
import 'package:todo/screens/components/todo_floating_action_button.dart';

import 'components/body.dart';

class TodoScreen extends StatelessWidget {
  final String id;

  const TodoScreen({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(id: id),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: TodoFloatingActionButton(),
      bottomNavigationBar: BottomBar(),
    );
  }
}
