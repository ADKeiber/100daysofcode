import 'package:basics/locator.dart';
import 'package:basics/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:basics/services/navigation_service.dart';

import 'package:responsive_builder/responsive_builder.dart';
import 'package:basics/widgets/navigation_drawer/navigation_drawer.dart';
import 'package:basics/widgets/center_view/center_view.dart';
import '../../widgets/navigation_bar/navigation_bar.dart';
import '../../routing/route_names.dart';

///Widget used to setup the overall design of the application
class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (ctx, info) {
        return Scaffold(
          //shows a drawer if page is not desktop sized else null
          drawer: info.isDesktop ? null : NavigationDrawer(),
          backgroundColor: Colors.white,
          body: CenteredView(
            child: Column(
              children: [
                NavigationBar(),
                Expanded(
                  child: Navigator(
                    key: locator<NavigationService>().navKey,
                    onGenerateRoute: generateRoute,
                    initialRoute: HomeRoute,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
