import 'package:flutter/material.dart';
import 'package:basics/datamodels/episode_item_model.dart';

import 'episode_item.dart';

///Widget contains all the information for the episodes
class EpisodesList extends StatelessWidget {
  final List<EpisodeItemModel> episodes;
  EpisodesList({this.episodes});

  Widget build(BuildContext context) {
    return Wrap(
      spacing: 30,
      runSpacing: 30,
      children: <Widget>[
        ...episodes.map(
          (episode) => EpisodeItem(model: episode),
        )
      ],
    );
  }
}
