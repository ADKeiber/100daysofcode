import 'package:flutter/widgets.dart';

///
///Data class used for containing the information of a navbar item
///including title, navigation path that it routes to and the icon it uses.
class NavBarItemModel {
  final String title;
  final String navigationPath;
  final IconData iconData;

  NavBarItemModel({
    this.title,
    this.navigationPath,
    this.iconData,
  });
}
