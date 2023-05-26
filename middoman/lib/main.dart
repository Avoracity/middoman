import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:middoman/screens/welcome_screen.dart';
import 'firebase_options.dart';
import '../get_started_container/get_started_page.dart';
import '../navigation_bar/tab_bar_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MiddomanApp());
}

class MiddomanApp extends StatelessWidget {
  const MiddomanApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Middoman App',
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const TabBarScreen();
            } else {
              return const WelcomeScreen();
            }
          },
        ));
  }
}
