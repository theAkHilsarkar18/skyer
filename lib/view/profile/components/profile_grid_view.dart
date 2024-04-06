import 'package:flutter/material.dart';
import 'package:skyer/global_modal/userData.dart';

import '../../../utils/globals.dart';

Widget profileGridView() {
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
              image: NetworkImage(userData[0]['posts'][index]['post_img']),
            ),
          ),
        ),
      ),
      itemCount: Globals.postImageUrlList.length,
    ),
  );
}
