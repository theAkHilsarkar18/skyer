import 'package:flutter/material.dart';
import 'package:skyer/utils/globals.dart';

import '../../../utils/colors.dart';

Column personalDetailColumn(BuildContext context, double height) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
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
        style:
            Theme.of(context).textTheme.bodyMedium!.copyWith(color: greyColor),
      ),
      SizedBox(height: height * 0.005),
      Text(
        Globals.userBio,
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: greyColor,
            ),
      ),
    ],
  );
}
