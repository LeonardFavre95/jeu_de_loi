import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jeu_de_loi/screen/home_sub_accueil.dart';
import 'package:jeu_de_loi/screen/home_sub_jeu.dart';
import 'package:jeu_de_loi/screen/home_sub_parametres.dart';

// home: const MyHomePage(title: 'Flutter Demo Home Page'),

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _selectedIndex;
  late Widget _accueil;
  late Widget _jeu;
  late Widget _parametres;
  late Widget _currentPage;
  late List<Widget> _pages;

  // final List<Widget> _items = [
  //   const Text(
  //     'Index 0: Accueil',
  //   ),
  //   const Text(
  //     'Index 1: Jeu',
  //   ),
  //   const Text(
  //     'Index 2: Paramètres',
  //   ),
  // ];
  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
    _accueil = const home_sub_accueil();
    _jeu = const home_sub_jeu();
    _parametres = const home_sub_parametres();
    _pages = [_accueil, _jeu, _parametres];
    _currentPage = _pages[_selectedIndex];
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      //https://www.codegrepper.com/code-examples/dart/flutter+bottom+navigation+bar+change+page
      body: _currentPage,
      // body: Center(
      //     child: IndexedStack(
      //         index: _selectedIndex,
      //         children: _items) //_items.elementAt(_index)
      //     ),
      bottomNavigationBar: _showBottomNav(),
    );
  }

// https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html

  Widget _showBottomNav() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: 'Accueil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_books),
          label: 'Jeu',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Paramètres',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      onTap: _onTap,
    );
  }

  void _onTap(int index) {
    _selectedIndex = index;
    _currentPage = _pages[index];
    setState(() {});
  }
}
