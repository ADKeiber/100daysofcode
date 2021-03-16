import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:basics/datamodels/navbar_item_model.dart';
import 'package:basics/locator.dart';
import 'package:basics/services/navigation_service.dart';
import 'package:basics/widgets/navbar_item/navbar_item_desktop.dart';
import 'package:basics/widgets/navbar_item/navbar_item_mobile.dart';

///Widget that is adaptive to mobile and desktop sizing and
///contains navigation bar item
class NavBarItem extends StatelessWidget {
  final String title;
  final String navPath;
  final IconData icon;
  const NavBarItem({this.title, this.navPath, this.icon});

  @override
  Widget build(BuildContext context) {
    var model = NavBarItemModel(
      title: title,
      navigationPath: navPath,
      iconData: icon,
    );
    return GestureDetector(
      onTap: () {
        // DON'T EVER USE A SERVICE DIRECTLY IN THE UI TO CHANGE ANY KIND OF STATE
        // SERVICES SHOULD ONLY BE USED FROM A VIEWMODEL
        locator<NavigationService>().navigateTo(navPath);
      },
      child: ScreenTypeLayout(
        tablet: NavBarItemTabletDesktop(
          model: model,
        ),
        mobile: NavBarItemMobile(
          model: model,
        ),
      ),
    );
  }
}
