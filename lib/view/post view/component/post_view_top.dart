import 'package:flutter/material.dart';

import '../../../global_modal/userData.dart';
import '../../../utils/colors.dart';
import '../../../utils/globals.dart';

Container postViewTopBar(double height, double width, BuildContext context,{required String postUserName}) {
  return Container(
    height: height * 0.08,
    padding: EdgeInsets.symmetric(horizontal: Globals.defaultPadding),
    // color: Colors.green.shade200,
    child: Row(
      children: [
        CircleAvatar(
          radius: width * 0.06,
          backgroundColor: whiteColor,
          backgroundImage: NetworkImage(
            userData[0]['profile_img'],
          ),
        ),
        SizedBox(
          width: width * 0.03,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              postUserName,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              userData[0]['profession'],
              style: Theme.of(context).textTheme.titleSmall,
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
  );
}
