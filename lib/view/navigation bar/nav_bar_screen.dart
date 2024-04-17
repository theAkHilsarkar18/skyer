import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skyer/firebase_services/firebase_model.dart';
import 'package:skyer/firebase_services/firebase_services.dart';
import 'package:skyer/utils/colors.dart';
import 'package:skyer/view/home/home_screen.dart';
import 'package:skyer/view/navigation%20bar/nav_bar_provider.dart';

import '../../utils/globals.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({super.key});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {

  // value re-call for update
  @override
  void initState() {
    // TODO: implement initState
    // userStreamData = firebaseServices!.readUser(email: FirebaseAuth.instance.currentUser!.email!);
    firebaseServices!.readUser(email: FirebaseAuth.instance.currentUser!.email!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final navBarProviderTrue = Provider.of<NavBarProvider>(context);
    final navBarProviderFalse =
        Provider.of<NavBarProvider>(context, listen: false);

    return Scaffold(
      body: Globals.screenList[navBarProviderTrue.currentIndex],
      bottomNavigationBar: AnimatedBottomNavigationBar(
        onTap: (p0) {
          navBarProviderFalse.changeIndex(p0);
        },
        activeIndex: Globals.screenIndex,
        backgroundColor: whiteColor,
        gapLocation: GapLocation.none,
        icons: const [
          CupertinoIcons.home,
          CupertinoIcons.search,
          CupertinoIcons.add_circled,
          CupertinoIcons.heart,
          CupertinoIcons.person,
        ],
      ),
    );
  }
}
