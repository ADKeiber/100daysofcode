import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:basics/styles/text_styles.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      var textAlignment =
          sizingInformation.isDesktop ? TextAlign.left : TextAlign.center;
      double descriptionSize = sizingInformation.isDesktop ? 21 : 16;

      return Container(
        width: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Flutter web. \nThe Basics",
              style: titleTextStyle(sizingInformation.deviceScreenType),
              textAlign: textAlignment,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'In this course we will go over the basics of using Flutter Web for website development. Topics will include Responsive Layout, Deploying, Font Changes, Hover Functionality, Modals and more.',
              style: descriptionTextStyle(sizingInformation.deviceScreenType),
              textAlign: textAlignment,
            ),
          ],
        ),
      );
    });
  }
}
