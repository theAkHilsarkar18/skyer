import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:skyer/utils/globals.dart';

Widget gridImageBox(
    {required int crossCount,
    required int mainCount,
    required String imageUrl}) {
  return StaggeredGridTile.count(
    mainAxisCellCount: mainCount,
    crossAxisCellCount: crossCount,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Globals.defaultPadding),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl),
        ),
      ),
    ),
  );
}
