import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

import '../../../utils/colors.dart';
import '../../../utils/globals.dart';
import '../provider/notification_provider.dart';

// Widget followNotificationBox(
//     double height, double width, BuildContext context, TextScaler textScale) {
//   return SizedBox(
//     height: height * 0.075,
//     // color: Colors.green.shade50,
//     child: Row(
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             border: Border.all(color: blackColor, width: 1),
//           ),
//           child: CircleAvatar(
//             backgroundColor: whiteColor,
//             backgroundImage: NetworkImage(Globals.profileImageUrlList[0]),
//             radius: width * 0.06,
//           ),
//         ),
//         SizedBox(width: width * 0.03),
//         Expanded(
//             child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               Globals.username2,
//               style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                     color: blackColor,
//                     fontSize: textScale.scale(9.5),
//                   ),
//             ),
//             Text(
//               '${Globals.followText}  1d',
//               style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                     color: greyColor,
//                     fontSize: textScale.scale(9),
//                   ),
//             ),
//           ],
//         )),
//         TextButton(
//           onPressed: () {},
//           child: Text(
//             'Follow',
//             style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                   color: blueColor,
//                   fontWeight: FontWeight.w500,
//                   fontSize: textScale.scale(11.5),
//                 ),
//           ),
//         ),
//       ],
//     ),
//   );
// }

Container followBox(double height, double width, BuildContext context) {
  final notificationProviderTrue =
      Provider.of<NotificationProvider>(context, listen: true);
  final notificationProviderFalse =
      Provider.of<NotificationProvider>(context, listen: false);
  return Container(
    height: height * 0.075,
    width: width,
    margin: EdgeInsets.symmetric(horizontal: width * 0.02),
    decoration: const BoxDecoration(
        // color: Colors.green.shade50
        ),
    child: Row(
      children: [
        CircleAvatar(
          radius: width * 0.065,
          backgroundImage: NetworkImage(Globals.profileImageUrl2),
        ),
        SizedBox(
          width: width * 0.05,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Globals.username2,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                '${Globals.followText}  1d',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: greyColor,
                      fontSize: 11,
                    ),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            notificationProviderFalse.changeFollowActionText();
          },
          child: Text(
            notificationProviderTrue.followActionText,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: (notificationProviderTrue.followActionText == 'Follow')
                    ? blueColor
                    : greenColor,
                fontSize: 12),
          ),
        ),
      ],
    ),
  );
}
