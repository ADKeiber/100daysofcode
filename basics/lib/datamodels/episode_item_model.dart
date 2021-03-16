///
/// Data class used to contain a videos information including
/// title duration and imageURL location
class EpisodeItemModel {
  final String title;
  final double duration;
  final String imageUrl;

  EpisodeItemModel({
    this.title,
    this.duration,
    this.imageUrl,
  });

  ///
  ///binds data
  EpisodeItemModel.fromJson(Map<String, dynamic> map)
      : title = map['title'],
        duration = map['duration'],
        imageUrl = map['imageUrl'];
}
