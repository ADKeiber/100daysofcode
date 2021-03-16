import 'package:flutter/foundation.dart';

///
///Data class model that is for a season that include the season title
///and description
class SeasonDetailsModel {
  final String title;
  final String description;

  SeasonDetailsModel({
    @required this.title,
    @required this.description,
  });
}
