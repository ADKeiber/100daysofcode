import 'package:basics/views/home/home_contents_desktop.dart';
import 'package:basics/views/home/home_contents_mobile.dart';
import 'package:basics/widgets/center_view/center_view.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../widgets/center_view/center_view.dart';
import '../../widgets/navigation_bar/navigation_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CenteredView(
        child: Column(
          children: [
            NavigationBar(),
            Expanded(
              child: ScreenTypeLayout(
                mobile: HomeContentMobile(),
                desktop: HomeContentDesktop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
