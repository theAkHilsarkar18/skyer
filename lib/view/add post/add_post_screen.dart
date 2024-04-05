import 'package:flutter/material.dart';
import 'package:skyer/view/post%20view/component/post_view_image.dart';
import 'package:skyer/view/post%20view/component/post_view_top.dart';

import '../../utils/global_key.dart';
import '../../utils/globals.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Post"),
      ),
      body: Column(
        children: [
          postViewTopBar(height, width, context),
          AspectRatio(
            aspectRatio: 3 / 2,
            child: Container(
              height: height * 0.4,
              width: width,
              decoration: BoxDecoration(
                color: Colors.green.shade200,
              ),
            ),
          ),
          postViewImage(height, width, Globals.postImageUrl1, GlobalKeysClass().globalKeyListForPostViewImage[0]),

        ],
      ),
    );
  }
}
