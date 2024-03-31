import 'package:flutter/material.dart';
import 'package:skyer/utils/globals.dart';

import '../../../utils/colors.dart';

Container likeNotificationBox(
    double height, double width, BuildContext context) {
  return Container(
    height: height * 0.075,
    width: width,
    margin: EdgeInsets.symmetric(horizontal: width * 0.02),
    decoration: const BoxDecoration(
        // color: Colors.green.shade50
        ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: width * 0.065,
          backgroundImage: NetworkImage(Globals.profileImageUrl3),
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
                Globals.username3,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                '${Globals.likeText}  1d',
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
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            // height: height,
            margin: EdgeInsets.all(Globals.defaultPadding / 2),
            width: width * 0.3,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(Globals.defaultPadding / 2),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(Globals.postImageUrlList[1]),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

//
// Widget likeNotificationBox(
//     double height, double width, BuildContext context, TextScaler textScale) {
//   return Container(
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
//             backgroundImage: NetworkImage(Globals.profileImageUrlList[2]),
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
//                 text: Globals.accountLikeNotificationText,
//                 style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                       color: blackColor,
//                       fontSize: textScale.scale(9.5),
//                     ),
//               ),
//               TextSpan(
//                 text: '  5d',
//                 style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                       color: greyColor,
//                       fontSize: textScale.scale(9),
//                     ),
//               ),
//             ]),
//           ),
//         ),
//         AspectRatio(
//           aspectRatio: 1,
//           child: Container(
//             // height: height,
//             margin: EdgeInsets.all(Globals.defaultPadding / 2),
//             width: width * 0.3,
//             decoration: BoxDecoration(
//               color: Colors.black,
//               borderRadius: BorderRadius.circular(Globals.defaultPadding / 2),
//               image: DecorationImage(
//                 fit: BoxFit.cover,
//                 image: NetworkImage(Globals.postImageUrlList[1]),
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
