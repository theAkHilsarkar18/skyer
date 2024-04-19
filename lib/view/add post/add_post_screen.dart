import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:skyer/firebase_services/firebase_services.dart';
import 'package:skyer/utils/colors.dart';
import 'package:skyer/view/add%20post/provider/add_post_provider.dart';
import 'package:skyer/view/add%20post/provider/text_controller.dart';
import 'package:skyer/view/navigation%20bar/nav_bar_provider.dart';
import 'package:skyer/view/post%20view/component/post_view_image.dart';
import 'package:skyer/view/post%20view/component/post_view_top.dart';

import '../../firebase_services/firebase_model.dart';
import '../../global_modal/userData.dart';
import '../../utils/global_key.dart';
import '../../utils/globals.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextScaler textScale = MediaQuery.of(context).textScaler;

    NavBarProvider navBarProviderTrue = Provider.of(context, listen: true);
    NavBarProvider navBarProviderFalse = Provider.of(context, listen: false);
    AddPostProvider addPostProviderTrue = Provider.of(context, listen: true);
    AddPostProvider addPostProviderFalse = Provider.of(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Post"),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("users")
              .doc(FirebaseAuth.instance.currentUser!.email)
              .snapshots(),
          builder: (context, snapshot) {
            // Map user = snapshot;

            if (snapshot.hasData) {
              Map userData = snapshot.data!.data() ?? {};
              userModel = UserModel(userData);

              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(Globals.defaultPadding),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: width * 0.06,
                            backgroundColor: whiteColor,
                            backgroundImage: NetworkImage(
                              userModel!.profileImg!,
                            ),
                          ),
                          SizedBox(
                            width: width * 0.03,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                userModel!.username!,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                userModel!.profession!,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 3 / 3,
                      child: GestureDetector(
                        onTap: () async {
                          File file =
                              await firebaseServices!.setImageFromGallery();

                          log("FILE IMAGE: $file");

                          addPostProviderFalse.storeImage(file);
                        },
                        child: Container(
                          height: height * 0.4,
                          width: width,
                          decoration: BoxDecoration(
                            color: greyColor.withOpacity(0.1),
                          ),
                          child: (addPostProviderTrue.fileImage != null)
                              ? Image.file(
                                  addPostProviderTrue.fileImage!,
                                  fit: BoxFit.cover,
                                )
                              : Icon(
                                  Icons.add_a_photo_outlined,
                                  size: textScale.scale(40),
                                  color: greyColor,
                                ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Globals.defaultPadding),
                      child: TextFormField(
                        controller: TextController.txtPostDescription,
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 3,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Describe about this post...',
                          hintStyle: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: greyColor,
                                  fontSize: textScale.scale(12)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Globals.defaultPadding),
                      child: TextFormField(
                        controller: TextController.txtPostDescription,
                        style: Theme.of(context).textTheme.bodySmall,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          // prefixIcon: const Icon(Icons.link),
                          border: InputBorder.none,
                          hintText: 'Attach link (optional)...',
                          hintStyle:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: greyColor,
                                    fontSize: textScale.scale(12),
                                  ),
                        ),
                      ),
                    ),
                    Container(
                      height: height * 0.07,
                      // color: Colors.red.shade50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            // color: Colors.yellow.shade50,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.alternate_email),
                                Text(' Tag People'),
                              ],
                            ),
                          ),
                          Container(
                            // color: Colors.yellow.shade50,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.tag),
                                Text(' Add Keywords'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        firebaseServices!.saveImageIntoStorage(
                            folder: 'Posts',
                            cloudPath: 'posts',
                            file: addPostProviderTrue.fileImage!);

                        addPostProviderTrue.fileImage = null;
                        navBarProviderFalse.changeIndex(0);
                      },
                      child: Container(
                        height: height * 0.07,
                        width: width,
                        margin: EdgeInsets.symmetric(
                            horizontal: Globals.defaultPadding,
                            vertical: Globals.defaultPadding * 2),
                        decoration: BoxDecoration(
                            color: blackColor,
                            borderRadius: BorderRadius.circular(10)),
                        alignment: Alignment.center,
                        child: Text(
                          'Upload Post',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: whiteColor),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            else
              {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
          }),
    );
  }
}
