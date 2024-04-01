import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skyer/view/post%20view/component/post_view_box.dart';

import '../../../utils/colors.dart';
import '../../../utils/global_key.dart';
import '../../../utils/globals.dart';
import '../home_screen.dart';
import 'home_post_action_bar.dart';
import 'home_post_box_main.dart';
import 'home_post_image.dart';

class HomePostsListView extends StatelessWidget {
  const HomePostsListView({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: Globals.profileImageUrlList.length,
      itemBuilder: (context, index) => postViewBox(
        height,
        width,
        context,
        commentCount: "18",
        likeCount: "811",
        postDescription: Globals.userPostDescription,
        postImageUrl: Globals.postImageUrlList[index],
        shareCount: '8',
        globalPostImageKey:
            GlobalKeysClass().globalKeyListForPostViewImage[index],
      ),
    );
  }
}
