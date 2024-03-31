import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationProvider extends ChangeNotifier {
  String followActionText = 'Follow';
  String followRequestText = 'Accept';

  void acceptFollowRequest() {
    if (followRequestText == 'Accept') {
      followRequestText = 'Follow';
    } else {
      followRequestText = 'Following';
    }
    notifyListeners();
  }

  void declineFollowRequest() {
    followRequestText = 'Accept';
    notifyListeners();
  }

  void changeFollowActionText() {
    if (followActionText == 'Follow') {
      followActionText = 'Following';
    } else {
      followActionText = 'Follow';
    }
    notifyListeners();
  }
}
