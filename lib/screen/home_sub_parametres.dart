import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class home_sub_parametres extends StatelessWidget {
  const home_sub_parametres({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //https://www.geeksforgeeks.org/flutter-implementing-signing-out-the-user/
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseAuth.instance.signOut();
          Navigator.pushNamed(context, "welcome_screen");
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.logout_rounded),
      ),
      body: const Center(),
    );
  }
}
