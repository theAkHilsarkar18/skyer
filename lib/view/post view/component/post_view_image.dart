import 'package:flutter/material.dart';
import 'package:skyer/view/post%20view/post_view.dart';

RepaintBoundary postViewImage(double height, double width, String postImageUrl,GlobalKey globalPostImageKey) {
  return RepaintBoundary(
    key: globalPostImageKey,
    child: AspectRatio(
      aspectRatio: 3 / 3,
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
    ),
  );
}
