import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/globals.dart';

Widget homeScrollableBox(BuildContext context,
    {required String username,
    required String imageUrl,
    required String profileImageUrl}) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;

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
                width: Globals.defaultPadding / 2,
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: blackColor, width: 1.5),
                ),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(profileImageUrl),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: Globals.defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: blackColor,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      Globals.userProfession,
                      style: Theme.of(context).textTheme.titleSmall,
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
