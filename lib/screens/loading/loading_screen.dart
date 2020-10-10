import 'package:flutter/material.dart';
import 'package:todo/screens/components/bottom_bar.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
