import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:skyer/firebase_services/firebase_model.dart';
import 'package:skyer/firebase_services/firebase_services.dart';
import 'package:skyer/global_modal/userData.dart';
import 'package:skyer/utils/colors.dart';
import 'package:skyer/utils/globals.dart';

Column profilePicColum(double width, double height, BuildContext context, UserModel userModel) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      GestureDetector(
        onTap: () {
          firebaseServices!.editProfilePhoto(folder: 'profile',cloudPath: 'profileImg');
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: blackColor, width: 1),
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            backgroundColor: whiteColor,
            radius: width * 0.15,
            backgroundImage: NetworkImage(userModel.profileImg!),
          ),
        ),
      ),
      SizedBox(
        height: height * 0.003,
      ),
      GestureDetector(
        onTap: () async {
          // await Clipboard.setData(const ClipboardData(text: 'skyer'));
        },
        child: Container(
          height: height * 0.042,
          // width: width*0.27,
          padding: EdgeInsets.symmetric(horizontal: Globals.defaultPadding * 2),
          decoration: BoxDecoration(
            color: blackColor,
            borderRadius: BorderRadius.circular(25),
          ),
          alignment: Alignment.center,
          child: Text(
            'Edit Profile',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: whiteColor, fontSize: 10),
          ),
        ),
      ),
    ],
  );
}
