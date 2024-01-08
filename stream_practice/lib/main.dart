import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  int calFun(int x) {
    return x * x;
  }

  Stream<int> test() {
    Duration duration = const Duration(seconds: 3);
    Stream<int> stream = Stream<int>.periodic(duration, calFun);

    return stream.take(5);
  }

  @override
  Widget build(BuildContext context) {
    // await, async 실습
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Test'),
        ),
        body: Center(
          child: StreamBuilder(
              stream: test(),
              builder: (BuildContext context, AsyncSnapshot<int> snapshop) {
                if (snapshop.connectionState == ConnectionState.done) {
                  return const Center(
                    child: Text(
                      'Complete',
                      style: TextStyle(fontSize: 30.0),
                    ),
                  );
                } else if (snapshop.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: CircularProgressIndicator(),
                        ),
                        Text(
                          'Waiting...',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  );
                }
                return Center(
                  child: Text(
                    "data: ${snapshop.data}",
                    style: const TextStyle(fontSize: 30.0),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
