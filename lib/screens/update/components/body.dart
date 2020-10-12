import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:todo/blocs/todo/todo_cubit.dart';
import 'package:todo/screens/update/components/square_icon_button.dart';

class Body extends StatefulWidget {
  final Todo todo;

  const Body({Key key, @required this.todo}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.todo.title)
      ..addListener(() {
        widget.todo.title = _controller.text;
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<TodoCubit>().pushTodo(widget.todo);
        return false;
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
            ),
          ),
          SwitchListTile(
            title: Text('completed'),
            value: widget.todo.completed,
            onChanged: (bool value) => widget.todo.completed = value,
          ),
          Expanded(
            child: Container(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SquareIconButton(
                iconData: MdiIcons.close,
                onPressed: () => context.bloc<TodoCubit>().goToList(),
              ),
              SquareIconButton(
                backgroundColor: Colors.grey.shade900,
                iconData: MdiIcons.check,
                onPressed: () =>
                    context.bloc<TodoCubit>().pushTodo(widget.todo),
              ),
            ],
          )
        ],
      ),
    );
  }
}
