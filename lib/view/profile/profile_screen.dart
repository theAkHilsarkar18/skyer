import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:skyer/utils/colors.dart';
import 'package:skyer/utils/globals.dart';

import 'components/profile_pic_details.dart';
import 'components/profile_stats.dart';
import 'components/profile_stats_row.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu_open,
              color: blackColor,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          profilePicAndDetails(height, width, context),
          profileStatsRow(height, width, context),
          const Divider(
            thickness: 0.3,
          ),
          Padding(
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
                  imageUrl: Globals.postImageUrl3,
                ),
                gridImageBox(
                  crossCount: 1,
                  mainCount: 1,
                  imageUrl: Globals.postImageUrl3,
                ),
                gridImageBox(
                  crossCount: 1,
                  mainCount: 1,
                  imageUrl: Globals.postImageUrl3,
                ),
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
                  imageUrl: Globals.postImageUrl3,
                ),
                gridImageBox(
                  crossCount: 1,
                  mainCount: 1,
                  imageUrl: Globals.postImageUrl3,
                ),
                gridImageBox(
                  crossCount: 1,
                  mainCount: 1,
                  imageUrl: Globals.postImageUrl3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
