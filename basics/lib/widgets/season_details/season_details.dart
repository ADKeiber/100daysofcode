import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:basics/datamodels/season_details_model.dart';
import 'package:basics/widgets/season_details/season_details_desktop.dart';
import 'package:basics/widgets/season_details/season_details_mobile.dart';

class SeasonDetails extends StatelessWidget {
  final SeasonDetailsModel details;
  const SeasonDetails({Key key, this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: SeasonDetailsDesktop(details: details),
      mobile: SeasonDetailsMobile(details: details),
    );
  }
}
