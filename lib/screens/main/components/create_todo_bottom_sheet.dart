import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/blocs/todo/todo_cubit.dart';

createTodoBottomSheet({
  BuildContext context,
}) =>
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8.0),
        ),
      ),
      builder: (_) => CreateTodoBottomSheet(
        cubit: context.bloc<TodoCubit>(),
      ),
    );

class CreateTodoBottomSheet extends StatefulWidget {
  final TodoCubit cubit;

  const CreateTodoBottomSheet({Key key, this.cubit}) : super(key: key);

  @override
  _CreateTodoBottomSheetState createState() => _CreateTodoBottomSheetState();
}

class _CreateTodoBottomSheetState extends State<CreateTodoBottomSheet> {
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "add todo",
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                child: Text("cancel"),
                onPressed: () => Navigator.of(context).pop(this),
              ),
              FlatButton(
                child: Text("done"),
                textColor: Theme.of(context).accentColor,
                onPressed: () {
                  widget.cubit.pushTodo(Todo(title: _controller.text));
                  Navigator.of(context).pop(this);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
