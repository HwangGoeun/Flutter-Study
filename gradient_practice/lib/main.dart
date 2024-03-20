import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Text(
            "Gradient Text",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..shader = const LinearGradient(
                    colors: <Color>[
                      Colors.pinkAccent,
                      Colors.deepPurpleAccent,
                      Colors.red
                    ],
                  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200, 100))),
          ),
        ),
      ),
    );
  }
}
