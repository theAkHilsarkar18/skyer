import 'package:flutter/cupertino.dart';

import '../../../utils/globals.dart';

Container homePostImageView(int index,double height) {
  return Container(
    height: height * 0.25,
    margin: EdgeInsets.all(Globals.defaultPadding),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(Globals.postImageUrlList[index]),
        )),
  );
}