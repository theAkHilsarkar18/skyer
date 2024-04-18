import 'package:cloud_firestore/cloud_firestore.dart';

UserModel? userModel;

class FirebaseModel {
  UserModel? user;
}

class UserModel {
  String? name;
  String? username;
  String? email;
  String? about;
  String? password;
  String? city;
  String? country;
  String? profileBanner;
  String? profession;
  String? profileImg;
  List? followers;
  List? following;
  List? posts;

  UserModel.set({
    this.name,
    this.email,
    this.city,
    this.country,
    this.password,
    this.username,
    this.followers,
    this.following,
    this.posts,
    this.about,
    this.profileBanner,
    this.profileImg,
    this.profession
  });

  factory UserModel(Map user) {
    return UserModel.set(
      name: user['name'],
      email: user['email'],
      city: user['city'],
      country: user['country'],
      password: user['password'] ?? "12345678",
      username: user['username'],
      followers: user['followers'],
      following: user['following'],
      profileBanner: user['profileBanner'],
      profileImg: user['profileImg'],
      posts: user['posts'],
      about: user['about'],
      profession: user['profession'],
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
