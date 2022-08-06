import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class homeSubAccueil extends StatefulWidget {
  const homeSubAccueil({Key? key}) : super(key: key);

  @override
  homeSubAccueilState createState() => homeSubAccueilState();
}

class homeSubAccueilState extends State<homeSubAccueil> {
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
