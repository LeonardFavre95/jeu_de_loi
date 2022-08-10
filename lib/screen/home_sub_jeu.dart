import 'dart:math';
import 'package:flutter/material.dart';
import 'package:jeu_de_loi/controller/infoController.dart';
import 'package:jeu_de_loi/screen/home_sub_jeu_quizz.dart';
import '../controller/questionController.dart';
import 'home_sub_jeu_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeSubJeu extends StatefulWidget {
  const HomeSubJeu({Key? key}) : super(key: key);

  @override
  HomeSubJeuState createState() => HomeSubJeuState();
}

class HomeSubJeuState extends State<HomeSubJeu> {
  int playerState = 0;
  int nextMove = 0;
  bool leftToRight = true;
  bool quizzDone = false;

  int diceNumber = 1;
  bool visible = false;

  static const List<String> buttonText = <String>[
    'Départ',
    '1',
    '2',
    '5',
    '4',
    '3',
    '6',
    '7',
    '8',
    '11',
    '10',
    '9',
    '12',
    '13',
    '14',
    '17',
    '16',
    '15',
    '18',
    '19',
    '20',
    '23',
    '22',
    '21',
    '24',
    '25',
    '26',
    '',
    '',
    'Arrivée',
  ];

  static const List<String> titleText = <String>[
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
    'Fiche de Reflexion',
    'Quiz 9',
    'Quiz 8',
    'Quiz 7',
    'Quiz 10',
    'Quiz 11',
    'Quiz 12',
    '',
    '',
    'Félicitations'
  ];

//Méthode pour afficher le dé
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

//Méthode pour changer la face du dé
  void changeDiceFace() {
    //to update things we use setstate()
    setState(() {
      diceNumber = Random().nextInt(6) + 1;
    });
  }

//https://blog.logrocket.com/using-sharedpreferences-in-flutter-to-store-data-locally/
//Méthode pour charger les données sauvegardées et les instancier dans le cas ou elles n'existent pas
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
//Méthode pour sauvegarder l'état dans lequel le jeu se trouve
  void saveState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setInt('playerState', playerState);
      prefs.setInt('nextMove', nextMove);
      prefs.setBool('leftToRight', leftToRight);
      prefs.setBool('quizzDone', quizzDone);
    });
  }

//Méthode permettant de supprimer les données sauvegarder et ainsi de réinitialiser l'état du jeu
  void deleteState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.remove('playerState');
      prefs.remove('nextMove');
      prefs.remove('leftToRight');
      prefs.remove('quizzDone');
    });
  }

//Méthode pour effectuer le nombre de déplacement à effectuer en fonction du résultat du dé
  void setNextDiceMove(int diceNumber) {
    setState(() {
      while (diceNumber > 0) {
        setNextMove();
        diceNumber--;
      }
    });
  }

//Méthode pour effectuer un déplacement sur le plateau de jeu
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

//Méthode pour changer la couleur de la bordure de la case sur laquelle le joueur se trouve
  Color setRightColor(int index) {
    if (playerState == index) {
      return Colors.redAccent;
    } else {
      return Colors.black;
    }
  }

//Méthode pour changer l'épaisseur de la bordure de la case
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
    loadState();
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
          padding: const EdgeInsets.all(15),
          children: List.generate(buttonText.length, (index) {
            return Card(
                child: GestureDetector(
                    onTap: () async {
                      //Teste pour rendre la case de position du jeu la seule case à pouvoir être appuyée
                      if (index == playerState) {
                        //Si l'index du plateau de jeu est inférieur à 3
                        if (index < 3) {
                          //https://fluttermaster.com/receive-returning-data-from-a-new-screen-in-flutter/
                          await Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomeSubJeuInfo(
                                title: titleText[index],
                                info: infoController.infos[index]),
                          ));
                          showDice();
                          if (!visible) {
                            setNextMove();
                          }
                        }
                        //Si l'index se tient entre 3 et 8
                        if (index >= 3 && index <= 8) {
                          //https://fluttermaster.com/receive-returning-data-from-a-new-screen-in-flutter/
                          await Navigator.of(context).push(MaterialPageRoute(
                              //Affichage de la question relative à la case
                              builder: (context) => HomeSubJeuQuizz(
                                    //https://github.com/Yukta-Koli/Quiz-App/blob/main/lib/screens/quiz/components/body.dart
                                    question:
                                        questionController.questions[index - 3],
                                    selectedText: titleText[index],
                                  )));
                          showDice();
                          if (!visible) {
                            setNextMove();
                          }
                        }
                        //Si l'index se tient entre 9 et 20
                        if (index > 8 && index < 21) {
                          //https://fluttermaster.com/receive-returning-data-from-a-new-screen-in-flutter/
                          await Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomeSubJeuInfo(
                                title: titleText[index],
                                info: infoController.infos[index - 6]),
                          ));
                          showDice();
                          if (!visible) {
                            setNextMove();
                          }
                        }
                        //Si l'index se tient entre 21 et 26
                        if (index >= 21 && index <= 26) {
                          //https://fluttermaster.com/receive-returning-data-from-a-new-screen-in-flutter/
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomeSubJeuQuizz(
                                    //https://github.com/Yukta-Koli/Quiz-App/blob/main/lib/screens/quiz/components/body.dart
                                    question: questionController
                                        .questions[index - 15],
                                    selectedText: titleText[index],
                                  )));
                          showDice();
                          if (!visible) {
                            setNextMove();
                          }
                        }
                        // Si l'index est plus grand que 26
                        if (index > 26) {
                          await Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomeSubJeuInfo(
                                title: titleText[index],
                                info: infoController.infos[index - 14]),
                          ));
                          deleteState();
                          loadState();
                        }
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      //https://stackoverflow.com/questions/45724567/flutter-boxdecoration-s-background-color-overrides-the-containers-background-co
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: setRightColor(index),
                          width: setRightWidth(index),
                        ),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.green,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        //https://medium.com/@AnInsightfulTechie/flutter-displaying-dynamic-contents-using-listview-builder-f2cedb1a19fb
                        buttonText[index],
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    )));
          }),
        ),
        //Test si le dé doit être affiché
        if (visible)
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.lightGreen),
              child: SizedBox(
                width: 200,
                height: 220,
                //choix de l'image
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
