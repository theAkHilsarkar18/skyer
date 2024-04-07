import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:skyer/view/auth/sign_in.dart';
import 'package:skyer/view/home/home_screen.dart';
import 'package:skyer/view/navigation%20bar/nav_bar_screen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const NavigationBarScreen();
          } else {
            return const SignInScreen();
          }
        },
      ),
    );
  }
}
