import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jeu_de_loi/controller/questionCcontroller.dart';
import 'package:jeu_de_loi/model/Question.dart';
import 'option.dart';

class HomeSubJeuQuizz extends StatelessWidget {
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
  Widget build(BuildContext context) {
    //https://medium.com/swlh/the-simplest-way-to-pass-and-fetch-data-between-stateful-and-stateless-widgets-pages-full-2021-c5dbce8db1db
    //https://github.com/Yukta-Koli/Quiz-App/blob/main/lib/screens/quiz/components/question_card.dart
    return Scaffold(
        appBar: AppBar(title: Text(selectedText)),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Text(
                question.question,
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    ?.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 10),
              //  ...List.generate(question.options.length, (index) => Option())
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
