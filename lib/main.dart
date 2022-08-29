import 'package:bill/screens/calculator/calculator.dart';
import 'package:bill/screens/login_screen/home_screen.dart';
import 'package:bill/utils/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weight App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: mainColor,
      ),
      home: const Calculator(),
    );
  }
}
