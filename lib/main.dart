import 'package:flutter/material.dart';

void main() {
  runApp(const SearchApp());
}

class SearchApp extends StatelessWidget {
  const SearchApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search App',
      theme: ThemeData(
        colorScheme: const ColorScheme.light().copyWith(
          primary: const Color(0xFF95B8D1),
          secondary: const Color(0xFFB8E0D2),
        ),
        hintColor: const Color(0xFFB8E0D2),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(
            color: Color(0xFF95B8D1),
          ),
        ),
        fontFamily: 'Roboto',
        primaryTextTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          bodyText1: TextStyle(fontSize: 18.0),
        ),
      ),
      home: Container(),
    );
  }
}
