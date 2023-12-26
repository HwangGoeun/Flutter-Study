import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextFieldPractice();
  }
}

class TextFieldPractice extends StatefulWidget {
  const TextFieldPractice({super.key});

  @override
  State<TextFieldPractice> createState() => _TextFieldPracticeState();
}

class _TextFieldPracticeState extends State<TextFieldPractice> {
  TextEditingController inputController = TextEditingController();

  var num = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("INPUT"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: TextField(
                controller: inputController,
                onChanged: (text) {
                  setState(() {
                    num = int.parse(text);
                  });
                  print(num);
                },
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(2),
                ],
                decoration: const InputDecoration(
                  hintText: "00",
                  contentPadding: EdgeInsets.all(3),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  num = int.parse(inputController.text);
                });
              },
              child: const Text("update"),
            ),
          ],
        ),
      ),
    );
  }
}
