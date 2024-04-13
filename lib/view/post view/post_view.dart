import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skyer/global_modal/userData.dart';
import 'package:skyer/utils/colors.dart';
import 'package:skyer/utils/global_key.dart';
import 'package:skyer/utils/globals.dart';

import 'component/post_view_box.dart';

class PostViewScreen extends StatelessWidget {
  const PostViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: Globals.postImageUrlList.length,
        itemBuilder: (context, index) => postViewBox(
          height,
          width,
          context,
          commentCount: "${userData[0]['posts'][index]['comment']}",
          likeCount: "${userData[0]['posts'][index]['like']}",
          postDescription: userData[0]['posts'][index]['post_desc'],
          postImageUrl: userData[0]['posts'][index]['post_img'],
          shareCount: '${userData[0]['posts'][index]['share']}',
          globalPostImageKey: GlobalKeysClass().globalKeyListForPostViewImage[index],
          postUserName: 'theakhilsarkar'
        ),
      ),
    );
  }

}
