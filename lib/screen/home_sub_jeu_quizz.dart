import 'package:flutter/material.dart';

class HomeSubJeuQuizz extends StatefulWidget {
  const HomeSubJeuQuizz({Key? key}) : super(key: key);

  @override
  _HomeSubJeuQuizzState createState() => _HomeSubJeuQuizzState();
}

class _HomeSubJeuQuizzState extends State<HomeSubJeuQuizz> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('hello'),
    ));
  }
}

Widget _quizz(int index) {
  return Expanded(
    child: IndexedStack(
      index: index,
      children: <Widget>[
        Container(
            child: Center(
                child: Text(
          'index 0 $index',
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ))),
        Container(
            child: Center(
                child: Text(
          'index 1 $index',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ))),
      ],
    ),
  );
}
