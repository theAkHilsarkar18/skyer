import 'package:flutter/material.dart';
import 'package:skyer/firebase_services/firebase_model.dart';

import '../../../utils/globals.dart';
import 'home_scroll_box.dart';

class TrendingProjectsList extends StatelessWidget {
  const TrendingProjectsList({
    super.key,
    required this.height,
    required this.width,
    required this.userList,
  });

  final double height;
  final double width;
  final List userList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.25,
      // color: Colors.black12,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: userList.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => homeScrollableBox(
          context,
          profileImageUrl: userList[index]['profileImg'],
          imageUrl: userList[index]["posts"][userList[index]["posts"].length-1],
          username: userList[index]['username'],
        ),
      ),
    );
  }
}
