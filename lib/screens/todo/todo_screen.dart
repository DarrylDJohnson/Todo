import 'package:flutter/material.dart';
import 'package:todo/screens/components/bottom_bar.dart';
import 'package:todo/screens/components/todo_floating_action_button.dart';

import 'components/body.dart';

class TodoScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: TodoFloatingActionButton(),
      bottomNavigationBar: BottomBar(),
    );
  }
}
