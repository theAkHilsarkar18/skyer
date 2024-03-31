import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/globals.dart';

Container commentNotificationBox(
    double height, double width, BuildContext context) {
  return Container(
    height: height * 0.075,
    width: width,
    margin: EdgeInsets.symmetric(horizontal: width * 0.02),
    // decoration: BoxDecoration(color: Colors.green.shade50),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: width * 0.065,
          backgroundImage: NetworkImage(Globals.profileImageUrl4),
        ),
        SizedBox(
          width: width * 0.05,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Globals.username4,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                '${Globals.commentText}: ${Globals.accountCommentText}  2d',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: greyColor,
                      fontSize: 11,
                    ),
              ),
            ],
          ),
        ),
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            // height: height,
            margin: EdgeInsets.all(Globals.defaultPadding / 2),
            width: width * 0.3,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(Globals.defaultPadding / 2),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(Globals.postImageUrlList[2]),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

//
