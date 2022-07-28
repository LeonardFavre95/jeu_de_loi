// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
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
  static const List<String> buttonText = <String>[
    'Start',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    'Réponse quiz 1-6',
    'Accueil',
    'réponses et bonne pratique',
    'Les RH et admin',
    'réponses et bonne pratique',
    'Les bureaux',
    'le bureau idéal',
    'salle de réunion',
    'Le coin repos, Le coin repas, Les lieux de stockage',
    'les bonnes pratiques du coin de repos',
    'La cave, les archives',
    'Récapitulation des bases'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _game(context),
    );
  }

  Widget _game(BuildContext context) {
    QuestionController questionController = (QuestionController());
    return GridView.count(
      reverse: true,
      crossAxisCount: 3,
      padding: const EdgeInsets.all(20),
      children: List.generate(buttonText.length, (index) {
        return GestureDetector(
          onTap: () {
            if (1 > index || index > 6) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeSubJeuInfo(selectedIndex: index),
                  ));
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeSubJeuQuizz(
                    //https://github.com/Yukta-Koli/Quiz-App/blob/main/lib/screens/quiz/components/body.dart
                    question: questionController.questions[index - 1],
                    selectedIndex: index,
                    selectedText: buttonText[index],
                  ),
                ),
              );
            }
          },
          child: Container(
            //https://stackoverflow.com/questions/45724567/flutter-boxdecoration-s-background-color-overrides-the-containers-background-co
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 0.7,
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
