import 'package:flutter/material.dart';
import 'package:flutter_app/screens/auth/login.dart';
import 'package:flutter_app/screens/home/home.dart';
import 'package:flutter_app/screens/survey/intro.dart';
import 'package:flutter_app/screens/survey/survey.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weme Wellbeing',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(secondary: Colors.amber),
      ),
      home: HomePage(),
      routes: {
        HomePage.routeName:(ctx)=> HomePage(),
        LoginPage.routeName: (ctx) => LoginPage(),
      IntroPage.routeName:(ctx)=> IntroPage(),
      SurveyPage.routeName:(ctx)=> SurveyPage(),},
    );
  }
}

