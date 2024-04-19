import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../utils/globals.dart';
import 'grid_tile.dart';

Padding staggeredGridView() {
  return Padding(
    padding: EdgeInsets.all(Globals.defaultPadding),
    child: StaggeredGrid.count(
      crossAxisCount: 3,
      crossAxisSpacing: Globals.defaultPadding,
      mainAxisSpacing: Globals.defaultPadding,
      children: [
        gridImageBox(
          crossCount: 2,
          mainCount: 2,
          imageUrl: Globals.postImageUrl1,
        ),
        gridImageBox(
          crossCount: 1,
          mainCount: 1,
          imageUrl: Globals.postImageUrl2,
        ),
        gridImageBox(
          crossCount: 1,
          mainCount: 1,
          imageUrl: Globals.postImageUrl3,
        ),
        gridImageBox(
          crossCount: 1,
          mainCount: 1,
          imageUrl: Globals.postImageUrl4,
        ),
        gridImageBox(
          crossCount: 1,
          mainCount: 1,
          imageUrl: Globals.postImageUrl1,
        ),
        gridImageBox(
          crossCount: 1,
          mainCount: 1,
          imageUrl: Globals.postImageUrl2,
        ),
        gridImageBox(
          crossCount: 2,
          mainCount: 2,
          imageUrl: Globals.postImageUrl3,
        ),
        gridImageBox(
          crossCount: 1,
          mainCount: 1,
          imageUrl: Globals.postImageUrl4,
        ),
        gridImageBox(
          crossCount: 1,
          mainCount: 1,
          imageUrl: Globals.postImageUrl1,
        ),
        gridImageBox(
          crossCount: 1,
          mainCount: 1,
          imageUrl: Globals.postImageUrl2,
        ),
        gridImageBox(
          crossCount: 1,
          mainCount: 1,
          imageUrl: Globals.postImageUrl3,
        ),
        gridImageBox(
          crossCount: 1,
          mainCount: 1,
          imageUrl: Globals.postImageUrl4,
        ),
        gridImageBox(
          crossCount: 3,
          mainCount: 1,
          imageUrl: Globals.postImageUrl2,
        ),
        gridImageBox(
          crossCount: 3,
          mainCount: 1,
          imageUrl: Globals.postImageUrl1,
        ),
        gridImageBox(
          crossCount: 1,
          mainCount: 2,
          imageUrl: Globals.postImageUrl3,
        ),
        gridImageBox(
          crossCount: 1,
          mainCount: 2,
          imageUrl: Globals.postImageUrl4,
        ),
        gridImageBox(
          crossCount: 1,
          mainCount: 2,
          imageUrl: Globals.postImageUrl1,
        ),
      ],
    ),
  );
}
