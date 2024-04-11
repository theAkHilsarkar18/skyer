import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseModel {
  UserModel? user;

  CollectionReference users = FirebaseFirestore.instance.collection("users");

  Future<void> createUser({
    required String username,
    required String email,
    required String password,
    required String city,
    required String country,
    required List followers,
    required List following,
    required List posts,
  }) {
    UserModel userModel = UserModel({
      "username": username,
      "email": email,
      "password": password,
      "city": city,
      "country": country,
      "followers": followers,
      "following": following,
      "posts": posts,
    });
    return users.add(userModel);
  }
}

class UserModel {
  String? name;
  String? username;
  String? email;
  String? password;
  String? city;
  String? country;
  List? followers;
  List? following;
  List? posts;

  UserModel._set({
    this.name,
    this.email,
    this.city,
    this.country,
    this.password,
    this.username,
    this.followers,
    this.following,
    this.posts,
  });

  factory UserModel(Map user) {
    return UserModel._set(
      name: user['name'],
      email: user['email'],
      city: user['city'],
      country: user['country'],
      password: user['password'] ?? "12345678",
      username: user['username'],
      followers: user['followers'],
      following: user['following'],
      posts: user['posts'],
    );
  }
}

class PostModel {
  String? imgUrl;
  String? description;
  int? likeCount;
  int? shareCount;
  int? commentCount;
  String? username;
  String? userImage;
  String? userProfession;

  PostModel._set({
    this.username,
    this.imgUrl,
    this.commentCount,
    this.description,
    this.likeCount,
    this.shareCount,
    this.userImage,
    this.userProfession,
  });

  factory PostModel(Map post) {
    return PostModel._set(
      username: post['username'],
      commentCount: post['commentCount'],
      description: post['description'],
      imgUrl: post['imgUrl'],
      userImage: post['userImage'],
      shareCount: post['shareCount'],
      likeCount: post['likeCount'],
      userProfession: post['userProfession'],
    );
  }
}
