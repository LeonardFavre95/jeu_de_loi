import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jeu_de_loi/controller/questionController.dart';
import 'package:jeu_de_loi/model/Question.dart';

class HomeSubJeuQuizz extends StatefulWidget {
  final String selectedText;
  final Question question;

  const HomeSubJeuQuizz(
      {Key? key, required this.selectedText, required this.question})
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
  }

  @override
  Widget build(BuildContext context) {
    //https://medium.com/swlh/the-simplest-way-to-pass-and-fetch-data-between-stateful-and-stateless-widgets-pages-full-2021-c5dbce8db1db
    //https://github.com/Yukta-Koli/Quiz-App/blob/main/lib/screens/quiz/components/question_card.dart
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.selectedText),
          centerTitle: true,
          //flèche retour
          automaticallyImplyLeading: false,
        ),
        body: Center(
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: IntrinsicWidth(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text(
                            style: const TextStyle(fontSize: 20),
                            widget.question.question,
                          )),
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
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(1),
                            child: const Text('Suivant')),
                      )
                    ],
                  ),
                ))));
  }
}
