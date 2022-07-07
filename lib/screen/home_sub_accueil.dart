import 'package:flutter/material.dart';

class home_sub_accueil extends StatelessWidget {
  const home_sub_accueil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Nice done', style: Theme.of(context).textTheme.headline6),
    );
  }
}
