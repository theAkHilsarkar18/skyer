import 'package:flutter/material.dart';

import '../../../utils/globals.dart';
import 'home_scroll_box.dart';

class TrendingProjectsList extends StatelessWidget {
  const TrendingProjectsList({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.23,
      // color: Colors.black12,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: Globals.profileImageUrlList.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => homeScrollableBox(
          context,
          profileImageUrl: Globals.profileImageUrlList[index],
          imageUrl: Globals.postImageUrlList[index],
          username: Globals.usernameList[index],
        ),
      ),
    );
  }
}
