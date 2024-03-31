import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skyer/view/notification/provider/notification_provider.dart';

import '../../../utils/colors.dart';
import '../../../utils/globals.dart';

// Widget followRequestNotificationBox(
//     double height, double width, BuildContext context, TextScaler textScale) {
//   return SizedBox(
//     height: height * 0.07,
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
//             backgroundImage: NetworkImage(Globals.profileImageUrlList[1]),
//             radius: width * 0.06,
//           ),
//         ),
//         SizedBox(width: width * 0.03),
//         Expanded(
//           child: Text.rich(
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//             TextSpan(children: [
//               TextSpan(
//                 text: Globals.accountFollowRequestNotificationText,
//                 style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                       color: blackColor,
//                       fontSize: textScale.scale(9.5),
//                     ),
//               ),
//               TextSpan(
//                 text: '  3d',
//                 style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                       color: greyColor,
//                       fontSize: textScale.scale(9),
//                     ),
//               ),
//             ]),
//           ),
//         ),
//         TextButton(
//           onPressed: () {},
//           child: Text(
//             'Confirm',
//             style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                   color: blueColor,
//                   fontWeight: FontWeight.w500,
//                   fontSize: textScale.scale(11.5),
//                 ),
//           ),
//         ),
//         IconButton(
//           onPressed: () {},
//           icon: Icon(
//             Icons.close,
//             size: textScale.scale(18),
//           ),
//         ),
//       ],
//     ),
//   );
// }

Container followRequestBox(double height, double width, BuildContext context) {
  NotificationProvider notificationProviderTrue =
      Provider.of<NotificationProvider>(context, listen: true);
  NotificationProvider notificationProviderFalse =
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
          backgroundImage: NetworkImage(Globals.profileImageUrl1),
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
                Globals.username1,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                '${Globals.followRequestText}  3d',
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
            notificationProviderFalse.acceptFollowRequest();
          },
          child: Text(
            notificationProviderTrue.followRequestText,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: (notificationProviderTrue.followRequestText ==
                          'Following')
                      ? greenColor
                      : blueColor,
                ),
          ),
        ),
        IconButton(
            onPressed: () {
              notificationProviderFalse.declineFollowRequest();
            },
            icon: const Icon(Icons.close)),
      ],
    ),
  );
}
