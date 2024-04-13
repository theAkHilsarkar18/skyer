import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skyer/firebase_services/firebase_model.dart';
import 'package:skyer/firebase_services/firebase_services.dart';
import 'package:skyer/utils/colors.dart';

import '../../utils/globals.dart';
import 'components/home_app_bar.dart';
import 'components/home_post_listview.dart';
import 'components/home_scrol_row.dart';
import 'components/home_title_row.dart';
import 'components/trending_projects.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState


    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: homeAppBar(context),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("users").doc("radha@gmail.com").snapshots(),
        builder: (context, snapshot) {
          // Map user = snapshot;

          if(snapshot.hasData)
            {
              print(snapshot.data!.data().toString());
              Map userData = snapshot.data!.data()!;
              userModel = UserModel(userData);

              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // todo trending projects horizontal list view
                    homeStoryScrollRow(height, width),
                    titleTextRow(context, title: "Trending Projects"),
                    TrendingProjectsList(
                      height: height,
                      width: width,
                    ),
                    const Divider(
                      thickness: 0.3,
                    ),
                    // todo home screen following posts
                    titleTextRow(context, title: "Today's Posts"),
                    HomePostsListView(width: width, height: height,postUserName: userModel!.username!,),
                  ],
                ),
              );
            }
          else
            {
              return SingleChildScrollView();
            }
        },
      )
      // bottomNavigationBar:
    );
  }
}
