import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:basics/datamodels/season_details_model.dart';
import 'package:basics/styles/text_styles.dart';

///Widget that displays the seasons details and is for desktop sizing
class SeasonDetailsDesktop extends StatelessWidget {
  final SeasonDetailsModel details;
  const SeasonDetailsDesktop({Key key, this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            details.title,
            style: titleTextStyle(sizingInformation.deviceScreenType),
          ),
          SizedBox(
            width: 50,
          ),
          Expanded(
            child: Text(
              details.description,
              style: descriptionTextStyle(sizingInformation.deviceScreenType),
            ),
          )
        ],
      ),
    );
  }
}
