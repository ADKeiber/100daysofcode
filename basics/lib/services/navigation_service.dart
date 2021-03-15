import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return navKey.currentState.pushNamed(routeName);
  }

  void goBack() {
    navKey.currentState.pop();
  }
}
