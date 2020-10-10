import 'package:flutter/material.dart';

settings(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) => Settings(),
  );
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          title: Text("Sort by"),
        ),
        Divider(),
        ListTile(
          title: Text("Rename scoreboard"),
        ),
        ListTile(
          title: Text("Delete scoreboard"),
        ),
        ListTile(
          title: Text("Clear players"),
        ),
      ],
    );
  }
}