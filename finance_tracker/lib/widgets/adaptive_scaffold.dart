import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveScaffold extends StatelessWidget {
  //contains the appbar
  final PreferredSizeWidget appBar;

  //contains the page body
  final pageBody;

  //contains the new transaction function
  final Function _startAddNewTransaction;
  AdaptiveScaffold(this.appBar, this.pageBody, this._startAddNewTransaction);
  @override
  Widget build(BuildContext context) {
    //Scaffold that is either cupertino (IOS) or regular scaffold (android)
    return Container(
      child: Platform.isIOS
          ? CupertinoPageScaffold(child: pageBody)
          : Scaffold(
              appBar: appBar,
              body: pageBody,
              floatingActionButton: Platform.isIOS
                  ? Container()
                  //button is only on if its on android but not ios
                  : FloatingActionButton(
                      child: Icon(Icons.add),
                      onPressed: () => _startAddNewTransaction(context),
                    ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            ),
    );
  }
}
