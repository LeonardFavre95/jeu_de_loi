import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jeu_de_loi/controller/infoController.dart';
import 'package:jeu_de_loi/model/Info.dart';
import 'package:jeu_de_loi/model/Question.dart';
import 'package:jeu_de_loi/screen/home_sub_jeu_quizz.dart';
import 'package:jeu_de_loi/model/Question.dart';
import '../controller/questionController.dart';
import 'home_sub_jeu_info.dart';

class HomeSubJeu extends StatefulWidget {
  const HomeSubJeu({Key? key}) : super(key: key);

  @override
  _HomeSubJeuState createState() => _HomeSubJeuState();
}

class _HomeSubJeuState extends State<HomeSubJeu> {
  int playerState = 0;
  int nextMove = 0;
  bool leftToRight = true;

  void setNextMove() {
    setState(() {
      if (leftToRight) {
        if (nextMove < 2) {
          nextMove++;
          playerState++;
        } else {
          playerState += 3;
          leftToRight = false;
        }
      } else {
        if (nextMove > 0) {
          playerState--;
          nextMove--;
        } else {
          playerState += 3;
          leftToRight = true;
        }
      }
    });
  }

  Color setRightColor(int index) {
    if (playerState == index) {
      return Colors.redAccent;
    } else {
      return Colors.black;
    }
  }

  double setRightWidth(int index) {
    if (playerState == index) {
      return 3;
    } else {
      return 1.5;
    }
  }

  static const List<String> buttonText = <String>[
    'Bienvenue',
    'Organisation',
    'Le B.A.BA',
    'Quiz 3',
    'Quiz 2',
    'Quiz 1',
    'Quiz 4',
    'Quiz 5',
    'Quiz 6',
    'réponses et bonne pratique',
    'Accueil',
    'Réponse quiz 1-6',
    'Les RH et admin',
    'réponses et bonne pratique',
    'Les bureaux',
    'Le coin repos, Le coin repas, Les lieux de stockage',
    'salle de réunion',
    'le bureau idéal',
    'les bonnes pratiques du coin de repos',
    'La cave, les archives',
    'Récapitulation des bases',
    'Quiz 3',
    'Quiz 2',
    'Quiz 1',
    'Quiz 4',
    'Quiz 5',
    'Quiz 6',
    '',
    '',
    'Félicitations'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _game(context));
  }

  Widget _game(BuildContext context) {
    QuestionController questionController = (QuestionController());
    InfoController infoController = (InfoController());
    return GridView.count(
      reverse: true,
      crossAxisCount: 3,
      padding: const EdgeInsets.all(20),
      children: List.generate(buttonText.length, (index) {
        return GestureDetector(
          onTap: () async {
            if (index == playerState) {
              if (3 > index || index > 8) {
                if (index > 8) {
                  //https://fluttermaster.com/receive-returning-data-from-a-new-screen-in-flutter/
                  //int result =
                  await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomeSubJeuInfo(
                        selectedIndex: index,
                        info: infoController.infos[index - 6]),
                  ));

                  setNextMove();
                  //setState(() => playerState += result);

                  //  Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => HomeSubJeuInfo(
                  //               selectedIndex: index,
                  //               info: infoController.infos[index - 6],
                  //               )));
                } else {
                  //https://fluttermaster.com/receive-returning-data-from-a-new-screen-in-flutter/
                  // int result =
                  await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomeSubJeuInfo(
                        selectedIndex: index,
                        info: infoController.infos[index]),
                  ));

                  setNextMove();
                  //setState(() => playerState += result);

                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => HomeSubJeuInfo(
                  //               selectedIndex: index,
                  //               info: infoController.infos[index],
                  //             )));
                }
              } else {
                //https://fluttermaster.com/receive-returning-data-from-a-new-screen-in-flutter/
                //int result =
                await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomeSubJeuQuizz(
                          //https://github.com/Yukta-Koli/Quiz-App/blob/main/lib/screens/quiz/components/body.dart
                          question: questionController.questions[index - 3],
                          selectedIndex: index,
                          selectedText: buttonText[index],
                        )));

                setNextMove();
                //setState(() => playerState += result);

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => HomeSubJeuQuizz(
                //       //https://github.com/Yukta-Koli/Quiz-App/blob/main/lib/screens/quiz/components/body.dart
                //       question: questionController.questions[index - 3],
                //       selectedIndex: index,
                //       selectedText: buttonText[index],
                //     ),
                //   ),
                // );
              }
            } else {
              return;
            }
          },
          child: Container(
            //https://stackoverflow.com/questions/45724567/flutter-boxdecoration-s-background-color-overrides-the-containers-background-co
            decoration: BoxDecoration(
              border: Border.all(
                color: setRightColor(index),
                width: setRightWidth(index),
              ),
              color: Colors.teal[100],
            ),
            alignment: Alignment.center,
            child: Text(
              //https://medium.com/@AnInsightfulTechie/flutter-displaying-dynamic-contents-using-listview-builder-f2cedb1a19fb
              buttonText[index],
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        );
      }),
    );
  }
}
