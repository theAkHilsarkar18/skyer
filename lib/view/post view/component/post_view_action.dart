import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:share_plus/share_plus.dart';
import 'package:skyer/utils/colors.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';


import '../post_view.dart';

Container postViewAction(double height, double width, String likeCount,
    String commentCount, String shareCount, BuildContext context,GlobalKey globalPostImageKey) {
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
          onPressed: () async {
            RenderRepaintBoundary boundary = globalPostImageKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
            final image = await boundary.toImage();
            final byteData = await image.toByteData(format: ImageByteFormat.png);
            final imageBytes = byteData?.buffer.asUint8List();

            final directory = await getApplicationDocumentsDirectory();
            if(imageBytes != null)
              {
                final imagePath = await File('${directory.path}/skyer_image1.png').create();
                print(imagePath);
                await imagePath.writeAsBytes(imageBytes);
              }

            final result = await Share.shareXFiles([XFile('${directory.path}/skyer_image1.png')], subject: 'Skyer Image', text: 'Skyer Image');
            if(result.status  == ShareResultStatus.success)
              {
                print("success fully shared !");
              }
            },
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
          onPressed: () async {
            RenderRepaintBoundary boundary = globalPostImageKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
            final image = await boundary.toImage();
            final byteData = await image.toByteData(format: ImageByteFormat.png);
            final imageBytes = byteData?.buffer.asUint8List();
            // final result = await ImageGallerySaver.saveImage(imageBytes!);
            // print(result.status);
            // await GallerySaver.saveImage(imageBytes!);
          },
          icon: Icon(
            color: blackColor,
            CupertinoIcons.bookmark_fill,
          ),
        ),
      ],
    ),
  );
}
