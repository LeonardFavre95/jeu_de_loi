import 'package:flutter/material.dart';

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
        //flèche retour
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Column(
            children: List.generate(
                info.text.length,
                (index) => Padding(
                      padding: const EdgeInsets.all(20),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          info.text[index],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Suivant')),
          )
        ]),
      ),
    );
  }
}
