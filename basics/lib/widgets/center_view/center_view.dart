import 'package:flutter/material.dart';

///Widget that centers all views
class CenteredView extends StatelessWidget {
  final Widget child;
  CenteredView({this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 70, vertical: 60),
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 1200,
        ),
        child: child,
      ),
    );
  }
}
