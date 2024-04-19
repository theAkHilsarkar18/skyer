import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

import '../view/add post/provider/add_post_provider.dart';
import 'firebase_model.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

FirebaseServices? firebaseServices;
Stream<DocumentSnapshot>? userStreamData;

class FirebaseServices {
  CollectionReference users = FirebaseFirestore.instance.collection("users");
  CollectionReference allPosts = FirebaseFirestore.instance.collection("allPosts");

  Future<void> createUser({
    required String username,
    required String email,
    required String profession,
    required String password,
    required String city,
    required String country,
    required String profileBanner,
    required String profileImg,
    required String name,
    required List followers,
    required List following,
    required List posts,
  }) {
    // UserModel userModel = UserModel({
    //   "username": username,
    //   "email": email,
    //   "password": password,
    //   "city": city,
    //   "country": country,
    //   "followers": followers,
    //   "following": following,
    //   "posts": posts,
    // });
    return users.doc(email).set({
      "profession" : profession,
      "username": username,
      "email": email,
      "password": password,
      "city": city,
      "country": country,
      "followers": followers,
      "following": following,
      "posts": posts,
      "name": name,
      "profileBanner": profileBanner,
      "profileImg": profileImg,
    });
  }

  Future<void> readUser({
    required String email,
  }) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        FirebaseFirestore.instance.collection("users").doc(email);
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await documentReference.get();
    if (documentSnapshot.exists) {
      Map userData = documentSnapshot.data()!;
      print("\n\n");
      print("\n\n" + userData.toString() + "\n\n");
      userModel = UserModel(userData);
      print(
          "\n---------------------------------------------------------${userModel!.name!}");
    } else {
      print(
          "\n\n---------------------------------doc not exist-------------------------------------\n\n");
    }
  }

  Future<void> editProfilePhoto(
      {required String cloudPath, required String folder}) async {
    // pick image from gallery
    ImagePicker imagePicker = ImagePicker();
    XFile? fileImage = await imagePicker.pickImage(source: ImageSource.gallery);
    File file = File(fileImage!.path);

    // create storage in firebase storage
    firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;
    // create reference or path where image will be store.
    final reference = firebase_storage.FirebaseStorage.instance
        .ref('$folder/${FirebaseAuth.instance.currentUser!.email}')
        .child('images/${file.path}');
    // put file in firebase storage
    await reference.putFile(
        file, firebase_storage.SettableMetadata(contentType: 'file/jpeg'));
    final profileUrl = await reference.getDownloadURL();
    users
        .doc(FirebaseAuth.instance.currentUser!.email)
        .update({cloudPath: profileUrl});
    print(profileUrl);
  }

  Future<File> setImageFromGallery() async {
    // pick image from gallery
    ImagePicker imagePicker = ImagePicker();
    XFile? fileImage = await imagePicker.pickImage(source: ImageSource.gallery);
    File file = File(fileImage!.path);

    return file;
  }

  Future<void> saveImageIntoStorage(
      {required String folder,
      required String cloudPath,
      required File file}) async {
    firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;
    final reference = firebase_storage.FirebaseStorage.instance
        .ref('$folder/${FirebaseAuth.instance.currentUser!.email}')
        .child(file.path);
    await reference.putFile(
        file, firebase_storage.SettableMetadata(contentType: 'file/jpeg'));
    final postUrl = await reference.getDownloadURL();

    DocumentReference<Map<String, dynamic>> documentReference =
        FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.email);
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await documentReference.get();

    Map<String, dynamic> data = documentSnapshot.data() ?? {};

    List posts = data['posts'];
    posts.add(postUrl);

    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .update({
      'posts': posts,
    });

    DocumentReference<Map<String, dynamic>> globalListReference =
    FirebaseFirestore.instance
        .collection("allPosts")
        .doc('allPostList');

    DocumentSnapshot<Map<String, dynamic>> listSnapshot =
    await globalListReference.get();

    Map<String, dynamic> listData = listSnapshot.data() ?? {};

    List globalPostList = listData['postList'];
    globalPostList.add(postUrl);

    FirebaseFirestore.instance
        .collection("allPosts")
        .doc('allPostList')
        .update({
      'postList': globalPostList,
    });
    
  }

  Future<void> deletePost(int index)
  async {

    DocumentReference<Map<String, dynamic>> documentReference =
    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.email);
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await documentReference.get();

    Map<String, dynamic> data = documentSnapshot.data() ?? {};

    List posts = data['posts'];




    DocumentReference<Map<String, dynamic>> globalListReference =
    FirebaseFirestore.instance
        .collection("allPosts")
        .doc('allPostList');

    DocumentSnapshot<Map<String, dynamic>> listSnapshot =
        await globalListReference.get();

    Map<String, dynamic> listData = listSnapshot.data() ?? {};

    List globalPostList = listData['postList'];
    globalPostList.remove(posts[index]);
    posts.removeAt(index);

    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .update({
      'posts': posts,
    });

    FirebaseFirestore.instance
        .collection("allPosts")
        .doc('allPostList')
        .update({
      'postList': globalPostList,
    });

  }

  
 
  
}
