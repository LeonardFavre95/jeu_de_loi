import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jeu_de_loi/controller/questionController.dart';
import 'package:jeu_de_loi/model/Question.dart';

class HomeSubJeuQuizz extends StatefulWidget {
  final int selectedIndex;
  final String selectedText;
  final Question question;

  const HomeSubJeuQuizz(
      {Key? key,
      required this.selectedIndex,
      required this.selectedText,
      required this.question})
      : super(key: key);

  @override
  HomeSubJeuQuizzState createState() => HomeSubJeuQuizzState();
}

class HomeSubJeuQuizzState extends State<HomeSubJeuQuizz> {
  bool isButtonpressed1 = false;
  bool isButtonpressed2 = false;
  bool isButtonpressed3 = false;

  Color buttonColor = Colors.grey;

  Color getTheRightColor(int option, bool isbuttonpressed) {
    switch (isbuttonpressed) {
      case true:
        if (widget.question.answer == option) {
          return Colors.green;
        } else {
          return Colors.red;
        }
      case false:
        return Colors.grey;
      default:
        return Colors.grey;
    }

    // if (!isButtonpressed1 || !isButtonpressed2 || !isButtonpressed3) {
    //   return Colors.grey;
    // } else if (widget.question.answer == option) {
    //   return Colors.green;
    // } else {
    //   return Colors.red;
    // }
  }

  @override
  Widget build(BuildContext context) {
    //https://medium.com/swlh/the-simplest-way-to-pass-and-fetch-data-between-stateful-and-stateless-widgets-pages-full-2021-c5dbce8db1db
    //https://github.com/Yukta-Koli/Quiz-App/blob/main/lib/screens/quiz/components/question_card.dart
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.selectedText),
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                style: const TextStyle(fontSize: 20),
                widget.question.question,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: getTheRightColor(0, isButtonpressed1)),
                onPressed: () {
                  setState(() {
                    isButtonpressed1 = true;
                  });
                },
                child: Text(widget.question.options[0]),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: getTheRightColor(1, isButtonpressed2)),
                onPressed: () {
                  setState(() {
                    isButtonpressed2 = true;
                  });
                },
                child: Text(widget.question.options[1]),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: getTheRightColor(2, isButtonpressed3)),
                onPressed: () {
                  setState(() {
                    isButtonpressed3 = true;
                  });
                },
                child: Text(widget.question.options[2]),
              ),
            ],
          ),
        ));
  }
}


// Widget _quizz() {
//   return Scaffold(
//     body: Center(child: Text('$selectedIndex')),
//   );
// return Expanded(
//   child: IndexedStack(
//     index: 0,
//     children: <Widget>[
//       Center(
//           child: Text(
//         '$selectedIndex',
//         //_items[selectedIndex]["1"],
//         style: const TextStyle(fontSize: 12),
//         textAlign: TextAlign.center,
//       ))
//     ],
//   ),
// );
// }

// class _HomeSubJeuQuizzState extends State<HomeSubJeuQuizz> {

//https://stackoverflow.com/questions/51360481/how-can-i-to-load-and-query-local-json-data-in-flutter-mobile-app
// Future<void> readJson() async {
//   final String response = await rootBundle.loadString('asset/question.json');
//   final data = await json.decode(response);
//   setState(() {
//     _items = data[widget.selectedText];
//   });
// }

//   @override
//   void initState() {
//     super.initState();
//     // readJson();
//   }

// }
