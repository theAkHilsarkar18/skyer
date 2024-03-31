import 'package:flutter/material.dart';
import 'package:skyer/utils/globals.dart';

import '../../../utils/colors.dart';

Widget personalDetailColumn(BuildContext context, double height) {
  return Container(
    height: height * 0.35,
    // color: Colors.green.shade100,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(height: height * 0.02),
        Text(
          Globals.username,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          Globals.userProfession,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(height: height * 0.005),
        Text(
          Globals.userLocation,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: greyColor),
        ),
      ],
    ),
  );
}
