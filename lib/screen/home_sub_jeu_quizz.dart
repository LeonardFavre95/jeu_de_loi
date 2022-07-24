import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeSubJeuQuizz extends StatelessWidget {
  final int selectedIndex;
  final String selectedText;
  const HomeSubJeuQuizz(
      {Key? key, required this.selectedIndex, required this.selectedText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    //https://stackoverflow.com/questions/51360481/how-can-i-to-load-and-query-local-json-data-in-flutter-mobile-app
    
    return Scaffold(
        appBar: AppBar(title: Text(selectedText)), body: _quizz(selectedText));
  }
}

Widget _quizz(String se) {
  return Expanded(
    child: IndexedStack(
      index: 0,
      children: <Widget>[
        Container(
            child: Center(
                child: Text(
          ,
          style: const TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        )))
      ],
    ),
  );
}




