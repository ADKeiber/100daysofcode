import 'package:flutter/material.dart';

import 'package:basics/datamodels/season_details_model.dart';
import 'package:basics/widgets/episodes_list/episode_list.dart';
import 'package:basics/widgets/season_details/season_details.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';
import 'package:basics/viewmodels/episodes_view_model.dart';

///Widget used for displaying content on the Episodes view
class EpisodesView extends StatelessWidget {
  const EpisodesView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<EpisodesViewModel>.withConsumer(
      viewModelBuilder: () => EpisodesViewModel(),
      onModelReady: (model) => model.getEpisodes(),
      builder: (context, model, child) => SingleChildScrollView(
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
            model.episodes == null
                ? CircularProgressIndicator()
                : EpisodesList(
                    episodes: model.episodes,
                  ),
          ],
        ),
      ),
    );
  }
}
