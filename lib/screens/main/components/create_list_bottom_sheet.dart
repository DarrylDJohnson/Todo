import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/blocs/todo/todo_cubit.dart';

createListBottomSheet({
  BuildContext context,
  Function(String) onComplete,
}) =>
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8.0),
        ),
      ),
      builder: (_) => CreateListBottomSheet(cubit: context.bloc<TodoCubit>()),
    );

class CreateListBottomSheet extends StatefulWidget {
  final TodoCubit cubit;

  const CreateListBottomSheet({
    Key key,
    this.cubit,
  }) : super(key: key);

  @override
  _CreateListBottomSheetState createState() => _CreateListBottomSheetState();
}

class _CreateListBottomSheetState extends State<CreateListBottomSheet> {
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
                  widget.cubit.createList( _controller.text);
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
