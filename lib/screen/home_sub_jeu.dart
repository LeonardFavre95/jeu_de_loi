import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jeu_de_loi/controller/infoController.dart';
import 'package:jeu_de_loi/model/Info.dart';
import 'package:jeu_de_loi/model/Question.dart';
import 'package:jeu_de_loi/screen/home_sub_jeu_quizz.dart';
import 'package:jeu_de_loi/model/Question.dart';
import '../controller/questionController.dart';
import 'home_sub_jeu_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeSubJeu extends StatefulWidget {
  const HomeSubJeu({Key? key}) : super(key: key);

  @override
  _HomeSubJeuState createState() => _HomeSubJeuState();
}

class _HomeSubJeuState extends State<HomeSubJeu> {
  int playerState = 29;
  int nextMove = 0;
  bool leftToRight = true;
  bool quizzDone = false;

  int diceNumber = 1;
  bool visible = false;

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

  void showDice() {
    setState(() {
      if (playerState >= 2 && playerState < 8 ||
          playerState >= 20 && playerState < 26) {
        visible = true;
      } else {
        visible = false;
      }
    });
  }

  void changeDiceFace() {
    //to update things we use setstate()
    setState(() {
      diceNumber = Random().nextInt(6) + 1;
    });
  }

//https://blog.logrocket.com/using-sharedpreferences-in-flutter-to-store-data-locally/
  void loadState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      playerState = (prefs.getInt('playerState') ?? 0);
      nextMove = (prefs.getInt('nextMove') ?? 0);
      leftToRight = (prefs.getBool('leftToRight') ?? true);
      quizzDone = (prefs.getBool('quizzDone') ?? false);
    });
  }

//https://blog.logrocket.com/using-sharedpreferences-in-flutter-to-store-data-locally/
  void saveState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setInt('playerState', playerState);
      prefs.setInt('nextMove', nextMove);
      prefs.setBool('leftToRight', leftToRight);
      prefs.setBool('quizzDone', quizzDone);
    });
  }

  void deleteState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.remove('playerState');
      prefs.remove('nextMove');
      prefs.remove('leftToRight');
      prefs.remove('quizzDone');
    });
  }

  void setNextDiceMove(int diceNumber) {
    setState(() {
      while (diceNumber > 0) {
        setNextMove();
        diceNumber--;
      }
    });
  }

  void setNextMove() {
    setState(() {
      if (leftToRight) {
        if (nextMove < 2) {
          nextMove++;
          playerState++;
          saveState();
        } else {
          playerState += 3;
          leftToRight = false;
          saveState();
        }
      } else {
        if (nextMove > 0) {
          playerState--;
          nextMove--;
          saveState();
        } else {
          playerState += 3;
          leftToRight = true;
          saveState();
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

  @override
  void initState() {
    super.initState();
    //charger les données sauvées
    //loadState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _game(context));
  }

  Widget _game(BuildContext context) {
    QuestionController questionController = (QuestionController());
    InfoController infoController = (InfoController());
    return Stack(
      children: [
        GridView.count(
          reverse: true,
          crossAxisCount: 3,
          padding: const EdgeInsets.all(20),
          children: List.generate(buttonText.length, (index) {
            return GestureDetector(
              onTap: () async {
                if (index == playerState) {
                  if (index < 3) {
                    //https://fluttermaster.com/receive-returning-data-from-a-new-screen-in-flutter/
                    await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HomeSubJeuInfo(
                          selectedIndex: index,
                          info: infoController.infos[index]),
                    ));
                    showDice();
                    if (!visible) {
                      setNextMove();
                    }
                  }
                  if (index >= 3 && index <= 8) {
                    //https://fluttermaster.com/receive-returning-data-from-a-new-screen-in-flutter/
                    await Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HomeSubJeuQuizz(
                              //https://github.com/Yukta-Koli/Quiz-App/blob/main/lib/screens/quiz/components/body.dart
                              question: questionController.questions[index - 3],
                              selectedText: buttonText[index],
                            )));
                    showDice();
                    if (!visible) {
                      setNextMove();
                    }
                  }
                  if (index > 8 && index < 21) {
                    //https://fluttermaster.com/receive-returning-data-from-a-new-screen-in-flutter/
                    //int result =
                    await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HomeSubJeuInfo(
                          selectedIndex: index,
                          info: infoController.infos[index - 6]),
                    ));
                    showDice();
                    if (!visible) {
                      setNextMove();
                    }
                  }

                  if (index >= 21 && index <= 26) {
                    //https://fluttermaster.com/receive-returning-data-from-a-new-screen-in-flutter/
                    await Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HomeSubJeuQuizz(
                              //https://github.com/Yukta-Koli/Quiz-App/blob/main/lib/screens/quiz/components/body.dart
                              question:
                                  questionController.questions[index - 15],
                              selectedText: buttonText[index],
                            )));
                    showDice();
                    if (!visible) {
                      setNextMove();
                    }
                  }
                  if (index > 26) {
                    await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HomeSubJeuInfo(
                          selectedIndex: index,
                          info: infoController.infos[index - 15]),
                    ));
                    deleteState();
                    loadState();
                  }
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
        ),
        if (visible)
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.teal),
              child: SizedBox(
                width: 200,
                height: 220,
                child: Image(image: AssetImage('assets/dice$diceNumber.png')),
              ),
              onPressed: () {
                changeDiceFace();
                Future.delayed(
                  const Duration(seconds: 1),
                  (() {
                    setState(() {
                      visible = false;
                    });
                  }),
                );
                if (playerState > 8) {
                  quizzDone = true;
                }
                if (!quizzDone) {
                  if (diceNumber + playerState > 8) {
                    nextMove = 2;
                    playerState = 11;
                    leftToRight = false;
                  } else {
                    setNextDiceMove(diceNumber);
                  }
                } else {
                  if (diceNumber + playerState > 26) {
                    nextMove = 2;
                    playerState = 29;
                    leftToRight = false;
                  } else {
                    setNextDiceMove(diceNumber);
                  }
                }
              },
            ),
          ),
      ],
    );
  }
}
