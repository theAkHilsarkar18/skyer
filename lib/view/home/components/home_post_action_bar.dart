import 'package:flutter/material.dart';

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
