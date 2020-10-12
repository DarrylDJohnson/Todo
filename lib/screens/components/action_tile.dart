import 'package:flutter/material.dart';

class ActionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onPressed;
  final Widget child;

  ActionTile({
    Key key,
    this.icon,
    this.onPressed,
    this.title,
  })  : child = Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.black54,
          ),
        ),
        super(key: key);

  ActionTile.custom({
    this.icon,
    this.child,
    this.onPressed,
  }) : title = null;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: child,
      onTap: () {
        onPressed();
        Navigator.of(context).pop(this);
      },
    );
  }
}
