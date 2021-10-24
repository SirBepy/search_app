import 'dart:async';

import 'package:flutter/material.dart';
import 'package:search_app/screens/list_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const ListScreen(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage('assets/images/github-icon.png')),
            Hero(
              tag: 'search_app',
              child: Text(
                'Search App',
                style: Theme.of(context).textTheme.headline3?.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
