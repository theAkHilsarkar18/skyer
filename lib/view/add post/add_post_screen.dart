import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:skyer/utils/colors.dart';
import 'package:skyer/view/add%20post/provider/add_post_provider.dart';
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

    AddPostProvider addPostProviderTrue = Provider.of(context,listen: true);
    AddPostProvider addPostProviderFalse = Provider.of(context,listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Post"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            postViewTopBar(height, width, context,postUserName: "theakhilsarkar"),
            AspectRatio(
              aspectRatio: 3 / 2,
              child: GestureDetector(
                onTap: () {
                  addPostProviderFalse.setImageFromGallery();
                },
                child: Container(
                  height: height * 0.4,
                  width: width,
                  decoration: BoxDecoration(
                    color: greyColor.withOpacity(0.1),
                  ),
                  child: Icon(Icons.add_a_photo_outlined,size: textScale.scale(40),color: greyColor,),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Globals.defaultPadding),
              child: TextFormField(
                controller: TextController.txtPostDescription,
                // style: Theme.of(context).textTheme,
                maxLines: 3,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Describe about this post...',
                  hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: greyColor,
                    fontSize: textScale.scale(12)
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: Globals.defaultPadding),
              child: TextFormField(
                controller: TextController.txtPostDescription,
                // style: Theme.of(context).textTheme,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  // prefixIcon: const Icon(Icons.link),
                  border: InputBorder.none,
                  hintText: 'Attach link (optional)...',
                  hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: greyColor,
                      fontSize: textScale.scale(12),
                  ),
                ),
              ),
            ),
            
            Container(
              height: height * 0.07,
              // color: Colors.red.shade50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    // color: Colors.yellow.shade50,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.alternate_email),
                        Text(' Tag People'),
                      ],
                    ),
                  ),
                  Container(
                    // color: Colors.yellow.shade50,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.tag),
                        Text(' Add Keywords'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            Container(
              height: height * 0.07,
              width: width,
              margin: EdgeInsets.symmetric(horizontal: Globals.defaultPadding,vertical: Globals.defaultPadding*2),
              decoration : BoxDecoration(
                color: blackColor,
                borderRadius: BorderRadius.circular(10)
              ),
              alignment: Alignment.center,
              child: Text('Upload Post',style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: whiteColor),),
            ),
          ],
        ),
      ),
    );
  }
}
