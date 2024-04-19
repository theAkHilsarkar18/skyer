import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skyer/firebase_services/firebase_model.dart';
import 'package:skyer/global_modal/userData.dart';
import 'package:skyer/utils/colors.dart';
import 'package:skyer/utils/global_key.dart';
import 'package:skyer/utils/globals.dart';

import 'component/post_view_box.dart';

class PostViewScreen extends StatelessWidget {
  const PostViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.email)
            .snapshots(),
        builder: (context, snapshot) {

          Map userDataMap = snapshot.data?.data() ?? {};
          userModel = UserModel(userDataMap);

          if (snapshot.hasData) {
            List<GlobalKey<State<StatefulWidget>>>?
                globalKeyListForPostViewImage =
                userModel?.posts!.map((e) => GlobalKey()).toList();

            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: userModel?.posts?.length,
              itemBuilder: (context, index) => postViewBox(
                index: index,
                  height, width, context,
                  commentCount: "${userData[0]['posts'][index]['comment']}",
                  likeCount: "${userData[0]['posts'][index]['like']}",
                  postDescription: userData[0]['posts'][index]['post_desc'],
                  postImageUrl: userModel?.posts?[index],
                  shareCount: '${userData[0]['posts'][index]['share']}',
                  globalPostImageKey: globalKeyListForPostViewImage![index],
                  postUserName: userModel!.username!),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
