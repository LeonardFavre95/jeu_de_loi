import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeSubJeuInfo extends StatelessWidget {
  final int selectedIndex;
  const HomeSubJeuInfo({Key? key, required this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$selectedIndex'),
        centerTitle: true,
      ),
      body: Center(child: Text('$selectedIndex')),
    );
  }
}
