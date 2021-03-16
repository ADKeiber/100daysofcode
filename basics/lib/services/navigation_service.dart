import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///class used to navigate between the views
class NavigationService {
  ///global key used to navigate views
  final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  ///navigates to a given view based on inputed string name
  Future<dynamic> navigateTo(String routeName) {
    return navKey.currentState.pushNamed(routeName);
  }

  ///returns to previous view
  void goBack() {
    navKey.currentState.pop();
  }
}
