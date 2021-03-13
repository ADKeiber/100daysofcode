import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MainHeader implements SliverPersistentHeaderDelegate {
  final double min;
  final double max;
  MainHeader({this.max, this.min});

  double get minExtent {
    return min;
  }

  double get maxExtent {
    return max;
  }

  TickerProvider get vsync {
    return null;
  }

  OverScrollHeaderStretchConfiguration get stretchConfiguration {
    return null;
  }

  PersistentHeaderShowOnScreenConfiguration get showOnScreenConfiguration {
    return null;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: Stack(
        children: [],
      ),
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;
}
