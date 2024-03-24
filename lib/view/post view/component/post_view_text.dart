import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/globals.dart';

Align postViewText(String postDescription, BuildContext context) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: Globals.defaultPadding),
      child: Text(
        textAlign: TextAlign.start,
        postDescription,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: blackColor,
            ),
      ),
    ),
  );
}
