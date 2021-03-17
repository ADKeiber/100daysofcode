import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:basics/datamodels/episode_item_model.dart';

class Api {
  static const String _apiEndpoint =
      'http://localhost:5000/thebasics-2f123-39c11/us-central1/thebasics/courseEpisodes';
  Future<dynamic> getEpisodes() async {
    var response = await http.get(
      Uri(path: _apiEndpoint),
    );

    print(response.statusCode);
    if (response.statusCode == 200) {
      var episodes = (json.decode(response.body) as List)
          .map((episode) => EpisodeItemModel.fromJson(episode))
          .toList();
      return episodes;
    }
    //failure

    return 'Could not fetch episodes';
  }
}
