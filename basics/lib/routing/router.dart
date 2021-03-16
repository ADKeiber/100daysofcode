import 'package:basics/routing/route_names.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'package:basics/views/home/home_view.dart';
import 'package:basics/views/about/about_view.dart';
import 'package:basics/views/episodes/episodes_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(HomeView());
      break;
    case AboutRoute:
      return _getPageRoute(AboutView());
      break;
    case EpisodesRoute:
      return _getPageRoute(EpisodesView());
      break;
    default:
  }
}

PageRoute _getPageRoute(Widget child) {
  return _FadeRoute(child: child);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  _FadeRoute({this.child})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
