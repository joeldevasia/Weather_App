import 'package:flutter/material.dart';
import 'package:clima/screens/loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              primary: Colors.white,
              side: BorderSide(color: Colors.transparent)),
        ),
      ),
      home: LoadingScreen(),
    );
  }
}
