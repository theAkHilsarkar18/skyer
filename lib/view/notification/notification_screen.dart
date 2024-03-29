import 'package:flutter/material.dart';
import 'package:skyer/utils/globals.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications',style: Theme.of(context).textTheme.bodyLarge,),
      ),
      body: Column(
        children: [
          Container(
            height: height*0.075,
            width: width,
            decoration: BoxDecoration(
              color: Colors.green.shade50
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: width * 0.065,
                  backgroundImage: NetworkImage(Globals.profileImageUrl1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
