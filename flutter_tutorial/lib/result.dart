import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int myScore;
  final Function restart;
  Result(this.myScore, this.restart);
  String get resultPhrase {
    var resultText = "You did it!";

    if (myScore <= 5) {
      resultText = "You are pretty POG!!!";
    } else if (myScore <= 8) {
      resultText = "Nothing cool here";
    } else {
      resultText = "You are just the worst!!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text("Restart Quiz!!"),
            onPressed: restart,
            textColor: Colors.white,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
