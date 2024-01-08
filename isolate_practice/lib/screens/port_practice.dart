import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';

class PortPractice extends StatefulWidget {
  const PortPractice({super.key});

  @override
  State<PortPractice> createState() => _PortPracticeState();
}

myIsolate(SendPort mainPort) {
  ReceivePort isoPort = ReceivePort();
  mainPort.send({'port': isoPort.sendPort});
  isoPort.listen((message) {
    if (message['msg'] != 'bye') {
      int count = message['msg'];
      mainPort.send({'msg': count * count});
    } else {
      isoPort.close();
    }
  });
}

class _PortPracticeState extends State<PortPractice> {
  String result = '';

  void onPress() async {
    ReceivePort mainPort = ReceivePort();
    await Isolate.spawn(myIsolate, mainPort.sendPort);

    SendPort? isoPort;
    mainPort.listen((message) {
      if (message['port'] != null) {
        isoPort = message['port'];
      } else if (message['msg'] != null) {
        setState(() {
          result = 'msg : ${message['msg']}';
        });
      }
    });

    int count = 0;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      count++;
      if (count < 6) {
        isoPort?.send({'msg': count});
      } else {
        isoPort?.send({'msg': 'bye'});
        mainPort.close();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('test'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                result,
                style: const TextStyle(fontSize: 30),
              ),
              ElevatedButton(
                onPressed: onPress,
                child: const Text('text1'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
