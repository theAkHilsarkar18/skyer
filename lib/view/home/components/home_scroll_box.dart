import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/globals.dart';

Widget homeScrollableBox(BuildContext context,
    {required String username,
    required String imageUrl,
    required String profileImageUrl}) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  TextScaler textScaler  = MediaQuery.of(context).textScaler;

  return Padding(
    padding: EdgeInsets.all(Globals.defaultPadding),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: height * 0.14,
          width: width * 0.5,
          decoration: BoxDecoration(
            border: Border.all(color: blackColor, width: 1),
            color: whiteColor,
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        SizedBox(
          height: Globals.defaultPadding,
        ),
        SizedBox(
          width: width * 0.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: width*0.01,
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: blackColor, width: 1.5),
                ),
                child: CircleAvatar(
                  radius: width * 0.05,
                  backgroundImage: NetworkImage(profileImageUrl),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: width*0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: blackColor,
                        fontSize: textScaler.scale(11),
                      ),
                    ),
                    Text(
                      Globals.userProfession,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: textScaler.scale(9),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
