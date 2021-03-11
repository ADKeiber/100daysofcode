import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function _startAddNewTransaction;
  final BuildContext ctx;
  Size get preferredSize {
    return new Size.fromHeight(MediaQuery.of(ctx).size.height * .075);
  }

  AdaptiveAppBar(this._startAddNewTransaction, this.ctx);
  @override
  Widget build(BuildContext context) {
    // final double MediaQuery.of(context).size;
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
