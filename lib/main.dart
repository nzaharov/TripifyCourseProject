import 'package:flutter/material.dart';
import 'package:tripify/screens/feed_screen/feed_screen.dart';

void main() {
  runApp(Tripify());
}

class Tripify extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tripify',
      theme: ThemeData(
        accentColor: const Color.fromRGBO(16, 108, 200, 1),
        primaryColor: const Color.fromRGBO(22, 217, 149, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FeedScreen(),
    );
  }
}
