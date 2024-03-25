import 'package:flutter/material.dart';
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
  };
}
