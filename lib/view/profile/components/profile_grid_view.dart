import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skyer/firebase_services/firebase_model.dart';
import 'package:skyer/global_modal/userData.dart';

import '../../../utils/globals.dart';

Widget profileGridView({required UserModel userModel}) {
  return Padding(
    padding: EdgeInsets.all(Globals.defaultPadding),
    child: GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: Globals.defaultPadding,
        crossAxisSpacing: Globals.defaultPadding,
      ),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/post_view');
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Globals.defaultPadding / 2),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(userModel.posts![index]),
            ),
          ),
        ),
      ),
      itemCount: Globals.postImageUrlList.length,
    ),
  );
}
