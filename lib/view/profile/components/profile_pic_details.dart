import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skyer/view/profile/components/profile_detail_column.dart';
import 'package:skyer/view/profile/components/profile_pic_column.dart';

import '../../../utils/colors.dart';
import '../../../utils/globals.dart';

Container profilePicAndDetails(
    double height, double width, BuildContext context) {
  return Container(
    height: height * 0.22,
    width: width,
    padding: EdgeInsets.symmetric(horizontal: Globals.defaultPadding * 2),
    alignment: Alignment.center,
    // color: greyColor,
    child: Row(
      // verticalDirection: VerticalDirection.down,
      children: [
        profilePicColum(width, height, context),
        SizedBox(
          width: width * 0.05,
        ),
        Expanded(child: personalDetailColumn(context, height)),
      ],
    ),
  );
}
