import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

Column profileStats(BuildContext context, double height,{required String title,required String count}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        count,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700),
      ),
      SizedBox(
        height: height * 0.001,
      ),
      Text(
        title,
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: greyColor, fontSize: 12),
      ),
    ],
  );
}