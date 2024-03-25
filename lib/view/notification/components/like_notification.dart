import 'package:flutter/material.dart';
import 'package:skyer/utils/globals.dart';

import '../../../utils/colors.dart';

Widget likeNotificationBox(
    double height, double width, BuildContext context, TextScaler textScale) {
  return Container(
    height: height * 0.07,
    // color: Colors.green.shade50,
    child: Row(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: blackColor, width: 1),
          ),
          child: CircleAvatar(
            backgroundColor: whiteColor,
            backgroundImage: NetworkImage(Globals.profileImageUrlList[2]),
            radius: width * 0.06,
          ),
        ),
        SizedBox(width: width * 0.03),
        Expanded(
          child: Text.rich(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            TextSpan(children: [
              TextSpan(
                text: Globals.accountLikeNotificationText,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: blackColor,
                      fontSize: textScale.scale(9.5),
                    ),
              ),
              TextSpan(
                text: '  5d',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: greyColor,
                      fontSize: textScale.scale(9),
                    ),
              ),
            ]),
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
                image: NetworkImage(Globals.postImageUrlList[1]),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
