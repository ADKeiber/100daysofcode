import 'package:flutter/material.dart';

import './question.dart';

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
  var questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      "What's your favorite color?",
      "What's your favorite animal?"
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First Applicatoin"),
        ),
        body: Column(
          children: [
            Question(
              questions[questionIndex],
            ),
            RaisedButton(
              child: Text("Answer one"),
              onPressed: _answerQuestion,
            ),
            RaisedButton(
              child: Text("Answer two"),
              onPressed: _answerQuestion,
            ),
            RaisedButton(
              child: Text("Answer three"),
              onPressed: _answerQuestion,
            ),
          ],
        ),
      ),
    );
  }
}
