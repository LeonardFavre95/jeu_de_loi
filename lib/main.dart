import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'screen/welcome_screen.dart';
import 'Screen/home_screen.dart';
import 'Screen/login_screen.dart';
import 'Screen/registration_screen.dart';

void main() async {
  //Connexion à Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String title = "Jeu de Loi";
  //User? loggedinUser;
  //String? initalRoute;
  //late StreamSubscription<User?> user;

  @override
  void initState() {
    //https://mercyjemosop.medium.com/keep-user-logged-in-flutter-firebase-decec83cbd87
    // user = _auth.authStateChanges().listen((user) {
    //   if (user == null) {
    //     initalRoute = "welcome_screen";
    //   } else {
    //     initalRoute = "home_screen";
    //   }
    // });
    super.initState();
  }

  @override
  void dispose() {
    //user.cancel();
    super.dispose();
  }

  // getCurrentUser() async {
  //   try {
  //     final user = _auth.authStateChanges().listen((event) {});
  //     if (user != null) {
  //       loggedinUser = user;
  //       initalRoute = "home_screen";
  //     }
  //     initalRoute = "welcome_screen";
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(primary: Colors.grey)),
          primarySwatch: Colors.green),
      initialRoute: FirebaseAuth.instance.currentUser == null
          ? "welcome_screen"
          : "home_screen",
      routes: {
        'welcome_screen': (context) => WelcomeScreen(),
        'registration_screen': (context) => const RegistrationScreen(),
        'login_screen': (context) => LoginScreen(),
        'home_screen': (context) => HomeScreen(
              title: title,
            )
      },
    );
  }
}
