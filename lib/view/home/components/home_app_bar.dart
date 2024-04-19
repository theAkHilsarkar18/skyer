import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skyer/firebase_services/firebase_model.dart';

import '../../../utils/colors.dart';
import '../../../utils/globals.dart';

AppBar homeAppBar(BuildContext context,UserModel userModel) {
  return AppBar(
    surfaceTintColor: whiteColor,
    leading: IconButton(
      icon: const Icon(Icons.menu),
      onPressed: () {},
    ),
    title: const Text('Discover'),
    actions: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: Globals.defaultPadding * 2),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/profile');
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: blackColor, width: 1),
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: 22,
              backgroundImage: NetworkImage(userModel.profileImg!),
            ),
          ),
        ),
      ),
    ],
  );
}
