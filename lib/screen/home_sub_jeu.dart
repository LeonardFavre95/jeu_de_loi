import 'package:flutter/material.dart';

class HomeSubJeu extends StatelessWidget {
  const HomeSubJeu({Key? key}) : super(key: key);
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
    'La cave, les archives',
    'Récapitulation des bases'
  ];
  @override
  Widget build(BuildContext context) {
    //child: Text(context.widget, style: Theme.of(context).textTheme.headline6),
    return InkWell(
      //onTap: () => ,
      child: GridView.count(
        reverse: true,
        crossAxisCount: 3,
        padding: const EdgeInsets.all(20),
        children: List.generate(18, (index) {
          return Padding(
            padding: const EdgeInsets.all(0),
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
      ),
    );
  }
}
