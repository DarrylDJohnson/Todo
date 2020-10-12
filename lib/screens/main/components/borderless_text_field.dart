import 'package:flutter/material.dart';

class BorderlessTextField extends StatefulWidget {
  final double padding;
  final String initialText;
  final String hintText;
  final TextStyle style;
  final Function(String) onChange;
  final Widget trailing;

  BorderlessTextField({
    Key key,
    this.hintText = '',
    this.style,
    this.onChange,
    this.initialText = '',
    this.trailing,
    this.padding,
  }) : super(key: key);

  @override
  _BorderlessTextFieldState createState() => _BorderlessTextFieldState();
}

class _BorderlessTextFieldState extends State<BorderlessTextField> {
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.initialText)
      ..addListener(() => widget.onChange(_controller.text));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(
        left: widget.padding ?? 72.0,
      ),
      title: TextField(
        style: widget.style ??
            Theme.of(context).textTheme.headline5.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
        controller: _controller,
        maxLines: null,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintStyle: widget.style != null
              ? widget.style.copyWith(color: Colors.grey.shade400)
              : Theme.of(context).textTheme.headline5.copyWith(
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w300,
                  ),
          hintText: widget.hintText,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
      trailing: widget.trailing,
    );
  }
}
