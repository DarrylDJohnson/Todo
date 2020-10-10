import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'menu.dart';
import 'settings.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
          ),
        ],
      ),
      child: BottomAppBar(
        clipBehavior: Clip.hardEdge,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(MdiIcons.menu),
              onPressed: () => menu(context),
            ),
            IconButton(
              icon: Icon(MdiIcons.dotsVertical),
              onPressed: () => settings(context),
            ),
          ],
        ),
      ),
    );
  }
}
