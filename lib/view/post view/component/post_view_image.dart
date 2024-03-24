import 'package:flutter/material.dart';

AspectRatio postViewImage(double height, double width, String postImageUrl) {
  return AspectRatio(
    aspectRatio: 3 / 2,
    child: Container(
      height: height * 0.4,
      width: width,
      decoration: BoxDecoration(
        // color: Colors.green.shade200,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(postImageUrl),
        ),
      ),
    ),
  );
}
