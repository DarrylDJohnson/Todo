import 'package:flutter/material.dart';
import 'package:todo/screens/components/bottom_bar.dart';

import 'components/body.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: BottomBar(),
    );
  }
}
