import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveButton extends StatelessWidget {
  //contains text on the button
  final String text;

  //contains a function that dictates on press functionality
  final Function handler;

  AdaptiveButton(this.text, this.handler);
  @override
  Widget build(BuildContext context) {
    //either ruturns a cupertino button (IOS ) or textbutton (android)
    return Container(
      child: Platform.isIOS
          ? CupertinoButton(
              onPressed: handler,
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : TextButton(
              onPressed: handler,
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
    );
  }
}
