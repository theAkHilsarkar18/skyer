import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/globals.dart';

Container postViewTopBar(double height, double width, BuildContext context) {
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
            Globals.profileImageUrl,
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
              Globals.username,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              Globals.userProfession,
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
