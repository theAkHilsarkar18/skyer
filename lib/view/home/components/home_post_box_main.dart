import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/globals.dart';
import 'home_post_action_bar.dart';
import 'home_post_image.dart';

Container homePostBoxMain(int index, BuildContext context,double height,double width) {
  return Container(
    padding: EdgeInsets.all(Globals.defaultPadding),
    height: height * 0.46,
    color: whiteColor,
    width: width,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: Globals.defaultPadding,
                  vertical: Globals.defaultPadding / 2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: blackColor, width: 1.5),
              ),
              child: CircleAvatar(
                radius: 25,
                backgroundImage:
                NetworkImage(Globals.profileImageUrlList[index]),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Globals.defaultPadding),
                  child: Text(
                    Globals.usernameList[index],
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Globals.defaultPadding),
                  child: Text(
                    Globals.professionList[index],
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: blackColor,
              ),
            ),
          ],
        ),
        homePostImageView(index,height),
        homePostActionBar(width),
        const Divider(
          thickness: 0.5,
        ),
      ],
    ),
  );
}