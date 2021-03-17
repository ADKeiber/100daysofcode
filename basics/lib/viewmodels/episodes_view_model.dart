import 'package:flutter/cupertino.dart';

import 'package:basics/datamodels/episode_item_model.dart';
import 'package:basics/services/api.dart';
import 'package:basics/locator.dart';

final _api = locator<Api>();

class EpisodesViewModel extends ChangeNotifier {
  List<EpisodeItemModel> _episodes;
  List<EpisodeItemModel> get episodes => _episodes;

  Future getEpisodes() async {
    var episodeResults = await _api.getEpisodes();

    if (episodeResults is String) {
    } else {
      _episodes = episodeResults;
    }
    _episodes = episodeResults;

    notifyListeners();
  }
}
