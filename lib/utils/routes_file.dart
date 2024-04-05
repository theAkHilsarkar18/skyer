import 'package:flutter/material.dart';
import 'package:skyer/view/add%20post/add_post_screen.dart';
import 'package:skyer/view/notification/notification_screen.dart';
import '../view/home/home_screen.dart';
import '../view/navigation bar/nav_bar_screen.dart';
import '../view/post view/post_view.dart';
import '../view/profile/profile_screen.dart';
import '../view/search/search_screen.dart';

class ScreenRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const NavigationBarScreen(),
    '/home': (context) => const HomeScreen(),
    '/profile': (context) => const ProfileScreen(),
    '/search': (context) => const SearchScreen(),
    '/post_view': (context) => const PostViewScreen(),
    '/notification': (context) => const NotificationScreen(),
    '/add_post': (context) => const AddPostScreen(),
  };
}
