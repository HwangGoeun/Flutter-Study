import 'package:flutter/material.dart';

import 'package:move_to_background/move_to_background.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        MoveToBackground.moveTaskToBack();
        return false;
      },
      child: MaterialApp(
        home: Scaffold(
          floatingActionButton: FloatingActionButton(
            // 플로팅 버튼 생성
            child: const Icon(Icons.arrow_downward), // 플로팅 버튼 아이콘
            onPressed: () {
              MoveToBackground.moveTaskToBack(); // 배경화면으로 이동
            },
          ),
          appBar: AppBar(
            title: const Text('MoveToBackground Example'),
          ),
          body: const Center(
            child: Text('Press the floating action button'),
          ),
        ),
      ),
    );
  }
}
