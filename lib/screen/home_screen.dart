import 'package:flutter/material.dart';
import 'package:jeu_de_loi/screen/home_sub_accueil.dart';
import 'package:jeu_de_loi/screen/home_sub_jeu.dart';
import 'package:jeu_de_loi/screen/home_sub_parametres.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late int _selectedIndex;
  late Widget _accueil;
  late Widget _jeu;
  late Widget _parametres;
  late Widget _currentPage;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
    _accueil = const HomeSubAccueil();
    _jeu = const HomeSubJeu();
    _parametres = const HomeSubParametres();
    _pages = [_accueil, _jeu, _parametres];
    _currentPage = _pages[_selectedIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        //flèche retour
        automaticallyImplyLeading: false,
      ),
      //https://www.codegrepper.com/code-examples/dart/flutter+bottom+navigation+bar+change+page
      body: _currentPage,

      bottomNavigationBar: _showBottomNav(),
    );
  }

// https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html
  Widget _showBottomNav() {
    return BottomNavigationBar(
      items: const [
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
