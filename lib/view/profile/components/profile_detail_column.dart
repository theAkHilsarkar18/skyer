import 'package:flutter/material.dart';
import 'package:skyer/firebase_services/firebase_model.dart';
import 'package:skyer/utils/globals.dart';

import '../../../global_modal/userData.dart';
import '../../../utils/colors.dart';

Widget personalDetailColumn(BuildContext context, double height,UserModel userModel) {
  return Container(
    height: height * 0.35,
    // color: Colors.green.shade100,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(height: height * 0.02),
        Text(
          userModel.name!,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          userModel.profession!,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(height: height * 0.005),
        Text(
          '${ userModel.city}, ${ userModel.country}',
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
