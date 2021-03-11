import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveAppBar extends StatelessWidget {
  final Function _startAddNewTransaction;
  AdaptiveAppBar(this._startAddNewTransaction);
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text("Personal Expenses"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CupertinoButton(
                  child: Icon(CupertinoIcons.add),
                  onPressed: () => _startAddNewTransaction(context),
                ),
              ],
            ),
          )
        : AppBar(
            title: Text(
              "Personal Expenses",
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _startAddNewTransaction(context),
              ),
            ],
          );
  }
}
