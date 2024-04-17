import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:skyer/firebase_services/firebase_model.dart';
import 'package:skyer/firebase_services/firebase_services.dart';
import 'package:skyer/global_modal/userData.dart';
import 'package:skyer/utils/colors.dart';
import 'package:skyer/utils/globals.dart';
import 'package:skyer/view/auth/firebase_auth.dart';

import 'components/profile_grid_view.dart';
import 'components/profile_pic_details.dart';
import 'components/profile_stats.dart';
import 'components/profile_stats_row.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    firebaseServices!.readUser(email: FirebaseAuth.instance.currentUser!.email!);
    print("\n\n---------------profile screen-----------------------------${userModel!.profileBanner}");
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: const Icon(Icons.arrow_back),
        // ),
        title: Text(
          userData[0]['username'],
        ),
        actions: [
          IconButton(
            onPressed: () {
              signOutUser();
            },
            icon: Icon(
              Icons.menu_open,
              color: blackColor,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          profilePicAndDetails(height, width, context),
          profileStatsRow(height, width, context),
          const Divider(
            thickness: 0.3,
          ),
          profileGridView(),
        ],
      ),
    );
  }
}
