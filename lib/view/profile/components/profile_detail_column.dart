import 'package:flutter/material.dart';
import 'package:skyer/utils/globals.dart';

import '../../../global_modal/userData.dart';
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
          userData[0]['name'],
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          userData[0]['profession'],
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(height: height * 0.005),
        Text(
          '${ userData[0]['city']}, ${ userData[0]['country']}',
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
