import 'package:basics/constants/app_colors.dart';
import 'package:flutter/material.dart';

///Widget used for the call to action button on mobile sizing
class CallToActionMobile extends StatelessWidget {
  final String title;
  const CallToActionMobile({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
      ),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
