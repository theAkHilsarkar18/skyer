import 'package:flutter/material.dart';
import 'package:skyer/firebase_services/firebase_model.dart';
import 'package:skyer/firebase_services/firebase_services.dart';

import '../../../global_modal/userData.dart';
import '../../../utils/colors.dart';
import '../../../utils/globals.dart';

Container postViewTopBar(double height, double width, BuildContext context,{required String postUserName, int? index}) {
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
            userModel!.profileImg!,
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
              userModel!.profession!,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
        const Spacer(),
        // delete post dropdown
        IconButton(
          onPressed: () {
            firebaseServices!.deletePost(index!);
          },
          icon: Icon(
            Icons.delete,
            color: blackColor,
          ),
        ),
      ],
    ),
  );
}
