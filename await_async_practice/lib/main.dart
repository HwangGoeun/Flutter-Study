import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // await, async 실습

  Future<int> funA() {
    return Future.delayed(const Duration(seconds: 3), () {
      return 10;
    });
  }

  Future<int> funB(int arg) {
    return Future.delayed(const Duration(seconds: 2), () {
      return arg * arg;
    });
  }

  Future<int> calFun() async {
    int aResult = await funA();
    int bResult = await funB(aResult);
    return bResult;
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
          child: FutureBuilder(
              future: calFun(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Center(
                    child: Text(
                      '${snapshot.data}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                  );
                }
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
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
