import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

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
  var _totalScore = 0;

  final _questions = const [
    {
      "questionText": "What's your favorite color?",
      "answers": [
        {"Text": "Black", "Score": 4},
        {"Text": "Red", "Score": 3},
        {"Text": "Green", "Score": 2},
        {"Text": "Purple", "Score": 1},
      ],
    },
    {
      "questionText": "What's your favorite animal?",
      "answers": [
        {"Text": "Gorilla", "Score": 3},
        {"Text": "Tiger", "Score": 4},
        {"Text": "Elephant", "Score": 2},
        {"Text": "Dog", "Score": 1},
      ],
    },
    {
      "questionText": "Who is the best?",
      "answers": [
        {"Text": "Me", "Score": 1},
        {"Text": "Me", "Score": 1},
        {"Text": "Me", "Score": 1},
        {"Text": "Me", "Score": 1}
      ],
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    if (_questionIndex < _questions.length) {
      setState(() {
        _questionIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First Applicatoin"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore),
      ),
    );
  }
}
