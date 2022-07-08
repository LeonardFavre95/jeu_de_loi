// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

class HomeSubJeu extends StatelessWidget {
  const HomeSubJeu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      //child: Text(context.widget, style: Theme.of(context).textTheme.headline6),
      child: GridView.count(
        reverse: true,
        crossAxisCount: 3,
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          Container(
            color: Colors.teal[100],
            alignment: Alignment.center,
            child: const Text(
              "1",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            color: Colors.teal[100],
            alignment: Alignment.center,
            child: const Text(
              "2",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            color: Colors.teal[100],
            alignment: Alignment.center,
            child: const Text(
              "3",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            color: Colors.teal[100],
            alignment: Alignment.center,
            child: const Text(
              "4",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            color: Colors.teal[100],
            alignment: Alignment.center,
            child: const Text(
              "5",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            color: Colors.teal[100],
            alignment: Alignment.center,
            child: const Text(
              "6",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            color: Colors.teal[100],
            alignment: Alignment.center,
            child: const Text(
              "7",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            color: Colors.teal[100],
            alignment: Alignment.center,
            child: const Text(
              "8",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            color: Colors.teal[100],
            alignment: Alignment.center,
            child: const Text(
              "9",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            color: Colors.teal[100],
            alignment: Alignment.center,
            child: const Text(
              "10",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            color: Colors.teal[100],
            alignment: Alignment.center,
            child: const Text(
              "11",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
