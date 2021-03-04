import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerTxt;

  Answer(this.selectHandler, this.answerTxt);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text(answerTxt),
        onPressed: selectHandler,
        color: Colors.blue,
        textColor: Colors.white,
      ),
      width: MediaQuery.of(context).size.width * .75,
    );
  }
}
