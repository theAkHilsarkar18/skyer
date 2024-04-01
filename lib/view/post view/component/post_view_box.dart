import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skyer/utils/globals.dart';
import 'package:skyer/view/post%20view/component/post_view_action.dart';
import 'package:skyer/view/post%20view/component/post_view_image.dart';
import 'package:skyer/view/post%20view/component/post_view_text.dart';
import 'package:skyer/view/post%20view/component/post_view_top.dart';

import '../../../utils/colors.dart';

Container postViewBox(double height, double width, BuildContext context,
    {required String postDescription,
    required String postImageUrl,
    required String likeCount,
    required String commentCount,
    required String shareCount,required GlobalKey globalPostImageKey}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: Globals.defaultPadding),
    height: height * 0.5,
    width: width,
    // color: Colors.green.shade50,
    child: Column(
      children: [
        // post view top bar
        postViewTopBar(height, width, context),
        // post image
        postViewImage(height, width, postImageUrl,globalPostImageKey),
        // post view bottom bar - like - comment - share
        postViewAction(
            height, width, likeCount, commentCount, shareCount, context,globalPostImageKey),
        // post description
        postViewText(postDescription, context),
      ],
    ),
  );
}
