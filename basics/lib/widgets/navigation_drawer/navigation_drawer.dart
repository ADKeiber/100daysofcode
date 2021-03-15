import 'package:basics/routing/route_names.dart';
import 'package:basics/widgets/navigation_drawer/drawer_item.dart';
import 'package:basics/widgets/navigation_drawer/navigation_drawer_header.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 16,
          ),
        ],
      ),
      child: Column(
        children: [
          NavigationDrawerHeader(),
          DrawerItem(
            title: "Episodes",
            icon: Icons.videocam,
            navPath: EpisodesRoute,
          ),
          DrawerItem(
            title: "About",
            icon: Icons.help,
            navPath: AboutRoute,
          ),
        ],
      ),
    );
  }
}
