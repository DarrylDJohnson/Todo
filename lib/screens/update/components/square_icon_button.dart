import 'package:flutter/material.dart';

class SquareIconButton extends StatelessWidget {
  final IconData iconData;
  final Color backgroundColor;
  final Function onPressed;

  const SquareIconButton({
    Key key,
    this.iconData,
    this.backgroundColor = Colors.white,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        color: backgroundColor,
        child: IconButton(
          color: backgroundColor.computeLuminance() < 0.3 ? Colors.white : Colors.black,
          icon: Icon(iconData),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
