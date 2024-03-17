import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/globals.dart';

Align titleTextRow(BuildContext context, {required String title}) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Globals.defaultPadding,
        // vertical: Globals.defaultPadding,
      ),
      child: Row(
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.refresh,
              color: blackColor,
            ),
          ),
        ],
      ),
    ),
  );
}
