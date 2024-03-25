import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:skyer/utils/colors.dart';

import '../../utils/globals.dart';
import 'components/follow-request.dart';
import 'components/follow_notification.dart';
import 'components/like_notification.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextScaler textScale = MediaQuery.of(context).textScaler;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Globals.defaultPadding),
        child: ListView(
          children: [
            followNotificationBox(height, width, context, textScale),
            followRequestNotificationBox(height, width, context, textScale),
            likeNotificationBox(height, width, context, textScale),
            commentNotificationBox(height, width, context, textScale),
          ],
        ),
      ),
    );
  }
}

Widget commentNotificationBox(
    double height, double width, BuildContext context, TextScaler textScale) {
  return Container(
    height: height * 0.08,
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
            backgroundImage: NetworkImage(Globals.profileImageUrlList[3]),
            radius: width * 0.06,
          ),
        ),
        SizedBox(width: width * 0.03),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Globals.accountCommentNotificationText,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: blackColor,
                      fontSize: textScale.scale(9.5),
                    ),
              ),
              Text.rich(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                TextSpan(
                  children: [
                    TextSpan(
                      text: Globals.accountCommentText,
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
                  ],
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
                image: NetworkImage(Globals.postImageUrlList[3]),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
