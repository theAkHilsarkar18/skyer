import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/globals.dart';
import '../home_screen.dart';
import 'home_post_action_bar.dart';

class HomePostsListView extends StatelessWidget {
  const HomePostsListView({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: Globals.profileImageUrlList.length,
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.all(Globals.defaultPadding),
        height: height * 0.46,
        color: whiteColor,
        width: width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: Globals.defaultPadding,
                      vertical: Globals.defaultPadding / 2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: blackColor, width: 1.5),
                  ),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        NetworkImage(Globals.profileImageUrlList[index]),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Globals.defaultPadding),
                      child: Text(
                        Globals.usernameList[index],
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Globals.defaultPadding),
                      child: Text(
                        Globals.professionList[index],
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                    color: blackColor,
                  ),
                ),
              ],
            ),
            Container(
              height: height * 0.25,
              margin: EdgeInsets.all(Globals.defaultPadding),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(Globals.postImageUrlList[index]),
                  )),
            ),
            Container(
              // color: Colors.black12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  postActionBox(
                    width: width,
                    icon: Icon(
                      CupertinoIcons.heart_fill,
                      color: primaryColor,
                    ),
                    count: '5789',
                    color: primaryColor,
                  ),
                  postActionBox(
                    width: width,
                    icon: Icon(
                      CupertinoIcons.quote_bubble,
                      color: blackColor,
                    ),
                    count: '23',
                    color: primaryColor,
                  ),
                  postActionBox(
                    width: width,
                    icon: Icon(
                      CupertinoIcons.share,
                      color: greyColor,
                    ),
                    count: '15',
                    color: primaryColor,
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 0.2,
            ),
          ],
        ),
      ),
    );
  }
}
