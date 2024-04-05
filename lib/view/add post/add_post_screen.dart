import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skyer/utils/colors.dart';
import 'package:skyer/view/add%20post/provider/text_controller.dart';
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
    TextScaler textScale  = MediaQuery.of(context).textScaler;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Post"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          postViewTopBar(height, width, context),
          AspectRatio(
            aspectRatio: 3 / 2,
            child: Container(
              height: height * 0.4,
              width: width,
              decoration: BoxDecoration(
                color: greyColor.withOpacity(0.1),
              ),
              child: Icon(Icons.add_a_photo_outlined,size: textScale.scale(40),color: greyColor,),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Globals.defaultPadding),
            child: TextFormField(
              controller: TextController.txtPostDescription,
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
