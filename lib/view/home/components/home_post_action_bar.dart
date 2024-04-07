import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';


Container homePostActionBar(double width) {
  return Container(
    // color: Colors.black12,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        postActionBox(
          width: width,
          icon: Icon(
            CupertinoIcons.heart_fill,
            color: primaryColor,
          ),
          count: '5789',
          color: primaryColor,
        ),
        postActionBox(
          width: width,
          icon: Icon(
            CupertinoIcons.quote_bubble,
            color: blackColor,
          ),
          count: '23',
          color: primaryColor,
        ),
        postActionBox(
          width: width,
          icon: Icon(
            CupertinoIcons.share,
            color: blackColor,
          ),
          count: '15',
          color: primaryColor,
        ),
      ],
    ),
  );
}


Widget postActionBox(
    {required Icon icon,
    required String count,
    required Color color,
    required double width}) {
  return Container(
    // color: Colors.black26,
    width: width * 0.3,
    child: Row(
      // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: icon,
        ),
        Container(
          // color: Colors.black38,
          alignment: Alignment.centerLeft,
          width: width * 0.15,
          child: Text(
            count.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}
