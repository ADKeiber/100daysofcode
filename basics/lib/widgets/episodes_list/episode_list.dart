import 'package:flutter/material.dart';
import 'package:basics/datamodels/episode_item_model.dart';

import 'episode_item.dart';

class EpisodesList extends StatelessWidget {
  final episodes = [
    EpisodeItemModel(
      title: 'Puppy plays with tennis ball!',
      duration: 14.07,
      imageUrl:
          'https://thezebra.org/wp-content/uploads/2020/07/Training-Time-Aug2020-GR-with-ball-scaled.jpg',
    ),
    EpisodeItemModel(
        title: 'Puppy taking a nap!',
        duration: 18.54,
        imageUrl:
            'https://hips.hearstapps.com/countryliving.cdnds.net/17/47/1511194376-cavachon-puppy-christmas.jpg'),
    EpisodeItemModel(
        title: 'Yo this dog has a tail on its head!',
        duration: 14.55,
        imageUrl:
            'https://thumbs-prod.si-cdn.com/1qIa0cbnPa9UXNjafR8nkmN2cAw=/800x600/filters:no_upscale()/https://public-media.si-cdn.com/filer/f1/91/f191086d-7313-4feb-852f-4e25ead804b8/75472763_2578086815605605_4243327242047848448_n.jpg'),
    EpisodeItemModel(
        title: 'What does this guy want?',
        duration: 14.55,
        imageUrl:
            'https://d17fnq9dkz9hgj.cloudfront.net/uploads/2020/04/shelter-dog-cropped-1.jpg'),
  ];

  @override
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
