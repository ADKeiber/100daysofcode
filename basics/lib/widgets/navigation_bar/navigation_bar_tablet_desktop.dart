import 'package:basics/routing/route_names.dart';
import 'package:flutter/material.dart';
import './navbar_logo.dart';

import 'package:basics/widgets/navbar_item/navbar_item.dart';

class NavigationBarTabletDesktop extends StatelessWidget {
  const NavigationBarTabletDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavBarLogo(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              NavBarItem(title: "Episodes", navPath: EpisodesRoute),
              SizedBox(
                width: 60,
              ),
              NavBarItem(title: "About", navPath: AboutRoute),
            ],
          ),
        ],
      ),
    );
  }
}
