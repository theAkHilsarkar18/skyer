import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skyer/firebase_services/firebase_model.dart';
import 'package:skyer/global_modal/userData.dart';
import 'package:skyer/view/profile/components/profile_detail_column.dart';
import 'package:skyer/view/profile/components/profile_pic_column.dart';

import '../../../firebase_services/firebase_services.dart';
import '../../../utils/colors.dart';
import '../../../utils/globals.dart';

Widget profilePicAndDetails(double height, double width, BuildContext context, UserModel userModel) {

  return Stack(
    children: [
      GestureDetector(
        onTap: () {
          firebaseServices!.editProfilePhoto(folder: 'banner',cloudPath: 'profileBanner');
        },
        child: Container(
          color: Colors.red.shade50,
          width: width,
          height: height * 0.12,
          child: Image.network(
            userModel.profileBanner!,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        height: height * 0.32,
        width: width,
        padding: EdgeInsets.symmetric(horizontal: Globals.defaultPadding * 2),
        alignment: Alignment.center,
        // color: Colors.green.shade50,
        child: Column(
          children: [
            Expanded(
              child: Row(
                // verticalDirection: VerticalDirection.down,
                children: [
                  profilePicColum(width, height, context,userModel),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Expanded(
                    child: personalDetailColumn(context, height,userModel),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.008),
            Text(
              userData[0]['about'],
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: greyColor,
                  ),
            ),
            SizedBox(height: height * 0.008),
          ],
        ),
      ),
    ],
  );
}
