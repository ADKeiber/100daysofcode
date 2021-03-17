import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

import 'package:basics/datamodels/navbar_item_model.dart';

///Widget contains navigation bar item for desktop sizing
class NavBarItemTabletDesktop extends ProviderWidget<NavBarItemModel> {
  @override
  Widget build(
    BuildContext context,
    NavBarItemModel model,
  ) {
    return Text(
      model.title,
      style: TextStyle(fontSize: 18),
    );
  }
}
