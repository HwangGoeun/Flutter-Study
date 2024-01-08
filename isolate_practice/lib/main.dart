import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:isolate_practice/screens/create_isolate.dart';
import 'package:isolate_practice/screens/port_practice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const PortPractice();
  }
}
