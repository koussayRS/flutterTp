import 'package:app_koussay/quise_page.dart';
import 'package:app_koussay/acceuil.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'quiz app by koussay',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const Acceuil(),
          '/home': (context) => QuizPage(),
        });
  }
}
