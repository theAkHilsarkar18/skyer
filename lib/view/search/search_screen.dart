import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skyer/view/search/component/staggered_grid_view.dart';

import '../../utils/globals.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("allPosts")
          .doc('allPostList')
          .snapshots(),
      builder: (context, snapshot) {
        Map allPostData = snapshot.data?.data() ?? {"postList":[]};
        List allPostList = allPostData['postList'];
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Search"),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.search),
                )
              ],
            ),
            body: GridView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: Globals.defaultPadding),
              itemCount: allPostList.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: Globals.defaultPadding,crossAxisSpacing: Globals.defaultPadding),
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Globals.defaultPadding),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(allPostList[index]),
                  ),
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Search"),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.search),
                )
              ],
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

//TODO StaggeredGridview
//staggeredGridView(),
