import 'package:calculator/screens/main_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData.dark(),
      initialRoute: MainScreen.route,
      routes: {
        MainScreen.route: (context) => MainScreen(),
      },
    );
  }
}
