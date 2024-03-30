import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skyer/utils/colors.dart';
import 'package:skyer/utils/globals.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Notifications'),
      ),
      body: Column(
        children: [
          followRequestBox(height, width, context),
        ],
      ),
    );
  }

  Container followRequestBox(
      double height, double width, BuildContext context) {
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
                  Globals.followRequestText,
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
            onPressed: () {},
            child: Text(
              'Accept',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: greenColor,
                  ),
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
        ],
      ),
    );
  }
}
