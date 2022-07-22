import 'package:flutter/material.dart';

class HomeSubJeu extends StatelessWidget {
  const HomeSubJeu({Key? key}) : super(key: key);

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
            ),
          );
        }),
      ),
    );
  }
  // Container(
  //   //https://stackoverflow.com/questions/45724567/flutter-boxdecoration-s-background-color-overrides-the-containers-background-co
  //   decoration: BoxDecoration(
  //       border: Border.all(color: Colors.black), color: Colors.teal[100]),
  //   alignment: Alignment.center,
  //   child: const Text(
  //     "Start",
  //     style: TextStyle(fontSize: 20),
  //   ),
  // ),
  // Container(
  //   decoration: BoxDecoration(
  //       border: Border.all(color: Colors.black), color: Colors.teal[100]),
  //   alignment: Alignment.center,
  //   child: const Text(
  //     "1",
  //     style: TextStyle(fontSize: 20),
  //   ),
  // ),
  // Container(
  //   decoration: BoxDecoration(
  //       border: Border.all(color: Colors.black), color: Colors.teal[100]),
  //   alignment: Alignment.center,
  //   child: const Text(
  //     "2",
  //     style: TextStyle(fontSize: 20),
  //   ),
  // ),
  // Container(
  //   decoration: BoxDecoration(
  //       border: Border.all(color: Colors.black), color: Colors.teal[100]),
  //   alignment: Alignment.center,
  //   child: const Text(
  //     "3",
  //     style: TextStyle(fontSize: 20),
  //   ),
  // ),
  // Container(
  //   decoration: BoxDecoration(
  //       border: Border.all(color: Colors.black), color: Colors.teal[100]),
  //   alignment: Alignment.center,
  //   child: const Text(
  //     "4",
  //     style: TextStyle(fontSize: 20),
  //   ),
  // ),
  // Container(
  //   decoration: BoxDecoration(
  //       border: Border.all(color: Colors.black), color: Colors.teal[100]),
  //   alignment: Alignment.center,
  //   child: const Text(
  //     "5",
  //     style: TextStyle(fontSize: 20),
  //   ),
  // ),
  // Container(
  //   decoration: BoxDecoration(
  //       border: Border.all(color: Colors.black), color: Colors.teal[100]),
  //   alignment: Alignment.center,
  //   child: const Text(
  //     "6",
  //     style: TextStyle(fontSize: 20),
  //   ),
  // ),
  // Container(
  //   decoration: BoxDecoration(
  //       border: Border.all(color: Colors.black), color: Colors.teal[100]),
  //   alignment: Alignment.center,
  //   child: const Text(
  //     "Réponse quiz 1-6",
  //     style: TextStyle(fontSize: 20),
  //   ),
  // ),
  // Container(
  //   decoration: BoxDecoration(
  //       border: Border.all(color: Colors.black), color: Colors.teal[100]),
  //   alignment: Alignment.center,
  //   child: const Text(
  //     "Accueil",
  //     style: TextStyle(fontSize: 20),
  //   ),
  // ),
  // Container(
  //   decoration: BoxDecoration(
  //       border: Border.all(color: Colors.black), color: Colors.teal[100]),
  //   alignment: Alignment.center,
  //   child: const Text(
  //     "réponses et bonne pratique",
  //     style: TextStyle(fontSize: 20),
  //   ),
  // ),
  // Container(
  //   decoration: BoxDecoration(
  //       border: Border.all(color: Colors.black), color: Colors.teal[100]),
  //   alignment: Alignment.center,
  //   child: const Text(
  //     "Les RH et admin",
  //     style: TextStyle(fontSize: 20),
  //   ),
  // ),
  // Container(
  //   decoration: BoxDecoration(
  //       border: Border.all(color: Colors.black), color: Colors.teal[100]),
  //   alignment: Alignment.center,
  //   child: const Text(
  //     "réponses et bonne pratique",
  //     style: TextStyle(fontSize: 20),
  //   ),
  // ),
  // Container(
  //   decoration: BoxDecoration(
  //       border: Border.all(color: Colors.black), color: Colors.teal[100]),
  //   alignment: Alignment.center,
  //   child: const Text(
  //     "Les bureaux",
  //     style: TextStyle(fontSize: 20),
  //   ),
  // ),
  // Container(
  //   decoration: BoxDecoration(
  //       border: Border.all(color: Colors.black), color: Colors.teal[100]),
  //   alignment: Alignment.center,
  //   child: const Text(
  //     "le bureau idéal",
  //     style: TextStyle(fontSize: 20),
  //   ),
  // ),
  // Container(
  //   decoration: BoxDecoration(
  //       border: Border.all(color: Colors.black), color: Colors.teal[100]),
  //   alignment: Alignment.center,
  //   child: const Text(
  //     "salle de réunion",
  //     style: TextStyle(fontSize: 20),
  //   ),
  // ),
  // Container(
  //   decoration: BoxDecoration(
  //       border: Border.all(color: Colors.black), color: Colors.teal[100]),
  //   alignment: Alignment.center,
  //   child: const Text(
  //     "Le coin repos, Le coin repas, Les lieux de stockage",
  //     style: TextStyle(fontSize: 14),
  //   ),
  // ),
  // Container(
  //   decoration: BoxDecoration(
  //       border: Border.all(color: Colors.black), color: Colors.teal[100]),
  //   alignment: Alignment.center,
  //   child: const Text(
  //     "La cave, les archives",
  //     style: TextStyle(fontSize: 20),
  //   ),
  // ),
  // Container(
  //   decoration: BoxDecoration(
  //       border: Border.all(color: Colors.black), color: Colors.teal[100]),
  //   alignment: Alignment.center,
  //   child: const Text(
  //     "Récapitulation des bases",
  //     style: TextStyle(fontSize: 18),
  //   ),
  // ),
  //     ),
  //   );
  // }
}
