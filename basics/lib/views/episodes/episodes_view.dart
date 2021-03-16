import 'package:flutter/material.dart';

import 'package:basics/datamodels/season_details_model.dart';
import 'package:basics/widgets/episodes_list/episode_list.dart';
import 'package:basics/widgets/season_details/season_details.dart';

class EpisodesView extends StatelessWidget {
  const EpisodesView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          SeasonDetails(
            details: SeasonDetailsModel(
              title: 'Puppies',
              description:
                  'This is a page that features a bunch of puppies doing things.',
            ),
          ),
          SizedBox(
            height: 50,
          ),
          EpisodesList(),
        ],
      ),
    );
  }
}
