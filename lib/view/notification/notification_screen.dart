import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skyer/utils/colors.dart';
import 'package:skyer/utils/globals.dart';
import 'package:skyer/view/notification/components/comment_text.dart';
import 'package:skyer/view/notification/components/follow_notification.dart';
import 'package:skyer/view/notification/components/like_notification.dart';

import 'components/follow-request.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextScaler textScale = MediaQuery.of(context).textScaler;

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
          followBox(height, width, context),
          likeNotificationBox(height, width, context),
          commentNotificationBox(height, width, context),
        ],
      ),
    );
  }
}
