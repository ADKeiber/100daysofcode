import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveScaffold extends StatelessWidget {
  final PreferredSizeWidget appBar;
  final pageBody;
  final Function _startAddNewTransaction;
  AdaptiveScaffold(this.appBar, this.pageBody, this._startAddNewTransaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Platform.isIOS
          ? CupertinoPageScaffold(child: pageBody)
          : Scaffold(
              appBar: appBar,
              body: pageBody,
              floatingActionButton: Platform.isIOS
                  ? Container()
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
