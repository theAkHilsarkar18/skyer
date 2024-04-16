import 'package:flutter/material.dart';
import 'package:skyer/view/auth/location_screen.dart';
import 'package:skyer/view/auth/sign_up.dart';
import 'package:skyer/view/auth/username_screen.dart';
import 'package:skyer/view/notification/notification_screen.dart';
import '../view/auth/auth_page.dart';
import '../view/auth/sign_in.dart';
import '../view/home/home_screen.dart';
import '../view/navigation bar/nav_bar_screen.dart';
import '../view/post view/post_view.dart';
import '../view/profile/profile_screen.dart';
import '../view/search/search_screen.dart';

class ScreenRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const AuthPage(),
    '/nav': (context) => const NavigationBarScreen(),
    '/home': (context) => const HomeScreen(),
    '/profile': (context) => const ProfileScreen(),
    '/search': (context) => const SearchScreen(),
    '/post_view': (context) => const PostViewScreen(),
    '/notification': (context) => const NotificationScreen(),
    '/auth': (context) => const AuthPage(),
    '/sign_in': (context) => const SignInScreen(),
    '/sign_up': (context) => const SignUpScreen(),
    '/username': (context) => const UsernameScreen(),
    '/location': (context) => const LocationScreen(),
  };
}
