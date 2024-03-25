import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/globals.dart';

Widget followRequestNotificationBox(
    double height, double width, BuildContext context, TextScaler textScale) {
  return SizedBox(
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
            backgroundImage: NetworkImage(Globals.profileImageUrlList[1]),
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
                text: Globals.accountFollowRequestNotificationText,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: blackColor,
                      fontSize: textScale.scale(9.5),
                    ),
              ),
              TextSpan(
                text: '  3d',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: greyColor,
                      fontSize: textScale.scale(9),
                    ),
              ),
            ]),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Confirm',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: blueColor,
                  fontWeight: FontWeight.w500,
                  fontSize: textScale.scale(11.5),
                ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.close,
            size: textScale.scale(18),
          ),
        ),
      ],
    ),
  );
}
