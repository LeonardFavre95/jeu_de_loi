import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeu_de_loi/screen/home_sub_accueil.dart';

import '../model/Info.dart';

class HomeSubJeuInfo extends StatelessWidget {
  final int selectedIndex;
  final Info info;
  const HomeSubJeuInfo(
      {Key? key, required this.selectedIndex, required this.info})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('$selectedIndex'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(
                children: List.generate(
                    info.text.length,
                    (index) => Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          info.text[index],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ))))));
  }
}
