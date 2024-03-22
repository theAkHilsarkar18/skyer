import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:skyer/utils/colors.dart';

import '../../utils/globals.dart';
import 'components/home_app_bar.dart';
import 'components/home_post_listview.dart';
import 'components/home_scroll_box.dart';
import 'components/home_title_row.dart';
import 'components/trending_projects.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: homeAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // todo trending projects horizontal list view
            titleTextRow(context, title: "Trending Projects"),
            TrendingProjectsList(
              height: height,
              width: width,
            ),
            const Divider(
              thickness: 0.3,
            ),
            // todo home screen following posts
            titleTextRow(context, title: "Today's Posts"),
            HomePostsListView(width: width, height: height),
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.black,
      //   elevation: 0,
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      //   onPressed: () {},
      //   child: Icon(
      //     CupertinoIcons.add,
      //     color: whiteColor,
      //   ),
      // ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
          backgroundColor: whiteColor,
          gapLocation: GapLocation.none,
          activeIndex: 0,
          onTap: (p0) {},
          height: height * 0.08,
          iconSize: 25,
          icons: const [
            CupertinoIcons.home,
            CupertinoIcons.search,
            CupertinoIcons.add_circled,
            CupertinoIcons.heart,
            CupertinoIcons.person,
          ]),
    );
  }
}
