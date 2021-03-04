import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        "questionText": "What's your favorite color?",
        "answers": ["Black", "Red", "Green", "Purple"],
      },
      {
        "questionText": "What's your favorite animal?",
        "answers": ["Gorilla", "Tiger", "Elephant", "Dog"],
      },
      {
        "questionText": "Who is the best?",
        "answers": ["Me", "Me", "Me", "Me"],
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First Applicatoin"),
        ),
        body: Column(
          children: [
            Question(questions[_questionIndex]['questionText']),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
