import 'package:flutter/material.dart';
import 'package:qr_scanner/screens/home_page.dart';
import 'package:qr_scanner/screens/ml_scan.dart';
import 'package:qr_scanner/screens/scan_qr.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const mlScan(),
    );
  }
}
