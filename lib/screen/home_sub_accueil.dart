import 'dart:math';
import 'package:flutter/material.dart';

class homeSubAccueil extends StatefulWidget {
  const homeSubAccueil({Key? key}) : super(key: key);

  @override
  homeSubAccueilState createState() => homeSubAccueilState();
}

class homeSubAccueilState extends State<homeSubAccueil> {
  int diceNumber = 1;
  void changeDiceFace() {
    //to update things we use setstate()
    setState(() {
      diceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Colors.teal),
      child: SizedBox(
        width: 200,
        height: 220,
        child: Image(image: AssetImage('assets/dice$diceNumber.png')),
      ),
      onPressed: () {
        changeDiceFace();
      },
    )

        //Text('Nice done', style: Theme.of(context).textTheme.headline6),
        );
  }
}

// class home_sub_accueil extends StatelessWidget {
//   const home_sub_accueil({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     int diceNumber = 1;

//     return Center(
//         child: ElevatedButton(
//       style: ElevatedButton.styleFrom(primary: Colors.red),
//       child: SizedBox(
//         width: 200,
//         height: 200,
//         child: Image(image: AssetImage('assets/dice$diceNumber.png')),
//       ),
//       onPressed: () {
//         diceNumber = Random().nextInt(6) + 1;
//       },
//     )
//         //Text('Nice done', style: Theme.of(context).textTheme.headline6),
//         );
//   }
// }
