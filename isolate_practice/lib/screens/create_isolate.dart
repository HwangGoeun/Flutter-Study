import 'dart:isolate';

import 'package:flutter/material.dart';

myIsolate(var arg) {
  Future.delayed(const Duration(seconds: 3), () {
    print('in myIsolate...&arg');
  });
}

class CreateIsolate extends StatelessWidget {
  const CreateIsolate({super.key});

  myIsolate2(var arg) {
    Future.delayed(const Duration(seconds: 2), () {
      print('in myIsolate2,,, &arg');
    });
  }

  void onPress() {
    print('onPress... before run isolate...');
    Isolate.spawn(myIsolate, 10);
    Isolate.spawn(myIsolate2, 20);
    print('onPress... after run isolate...');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('test'),
        ),
        body: ElevatedButton(
          onPressed: onPress,
          child: const Text('Button'),
        ),
      ),
    );
  }
}
