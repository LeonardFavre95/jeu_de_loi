import 'package:flutter/material.dart';

class HomeSubAccueil extends StatefulWidget {
  const HomeSubAccueil({Key? key}) : super(key: key);

  @override
  HomeSubAccueilState createState() => HomeSubAccueilState();
}

class HomeSubAccueilState extends State<HomeSubAccueil> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(30),
        child: Text(
          'Bienvenue',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      SizedBox(
        height: 240,
        child: Image.asset(
          'assets/goose.jpg',
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(30),
        child: Text(
          'Une Plate-forme de sensibilisation à la thématique de la protection des données basé sur la Convention internationale 108',
          style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.center,
        ),
      )
    ]));
  }
}
