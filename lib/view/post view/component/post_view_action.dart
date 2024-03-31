import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skyer/utils/colors.dart';

Container postViewAction(double height, double width, String likeCount,
    String commentCount, String shareCount, BuildContext context) {
  return Container(
    height: height * 0.05,
    width: width,
    // color: Colors.green.shade300,
    child: Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            color: primaryColor,
            CupertinoIcons.heart_fill,
          ),
        ),
        Text(
          likeCount,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.chat_bubble,
            color: blackColor,
          ),
        ),
        Text(
          commentCount,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            color: blackColor,
            CupertinoIcons.arrowshape_turn_up_right,
          ),
        ),
        Text(
          shareCount,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            color: blackColor,
            CupertinoIcons.bookmark_fill,
          ),
        ),
      ],
    ),
  );
}
