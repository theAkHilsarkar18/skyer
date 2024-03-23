import 'package:flutter/material.dart';
import 'package:skyer/view/profile/components/profile_stats.dart';

import '../../../utils/globals.dart';

Container profileStatsRow(double height, double width, BuildContext context) {
  return Container(
    height: height * 0.08,
    width: width,
    margin: EdgeInsets.symmetric(horizontal: Globals.defaultPadding * 2),
    decoration: BoxDecoration(
      // color: Colors.yellow,
      borderRadius: BorderRadius.circular(Globals.defaultPadding),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        profileStats(context, height, title: 'Posts', count: '190'),
        profileStats(context, height, title: 'Followers', count: '1.5M'),
        profileStats(context, height, title: 'Following', count: '71'),
      ],
    ),
  );
}
