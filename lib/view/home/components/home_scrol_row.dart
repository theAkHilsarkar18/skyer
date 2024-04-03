
import 'package:flutter/material.dart';
import 'package:skyer/utils/globals.dart';

import '../../../utils/colors.dart';

Container homeStoryScrollRow(double height, double width) {
  return Container(
    height: height * 0.08,
    // color: Colors.red.shade50,
    child: ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => Container(
        margin: EdgeInsets.symmetric(horizontal: Globals.defaultPadding),
        height: height * 0.1,
        width: width * 0.16,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            // borderRadius: BorderRadius.circular(Globals.defaultPadding),
            // border: Border.all(color: blackColor,width: 2,),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(Globals.profileImageUrlList[index]),
            )
        ),),
      itemCount:4,
      scrollDirection: Axis.horizontal,
    ),
  );
}