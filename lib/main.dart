import 'package:flutter/material.dart';
import 'package:dev_quiz/home/home-page.dart';
import 'package:dev_quiz/splash/splash_page.dart';
import 'package:dev_quiz/challenge/challenge_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevQuiz',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
