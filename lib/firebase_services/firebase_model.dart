class FirebaseModel {
  UserModel? user;
  List? followers;
  List? following;
  List? posts;

  FirebaseModel._set({this.followers,this.following,this.posts,this.user});

  void createUser()
  {
    UserModel userModel = UserModel({});
    FirebaseModel firebaseModel = FirebaseModel._set(followers: [],following: [],posts: [],user: userModel);

  }

}

class UserModel {
  String? name;
  String? username;
  String? email;
  String? password;
  String? city;
  String? country;

  UserModel._set({
    this.name,
    this.email,
    this.city,
    this.country,
    this.password,
    this.username,
  });

  factory UserModel(Map user) {
    return UserModel._set(
      name: user['name'],
      email: user['email'],
      city: user['city'],
      country: user['country'],
      password: user['password'] ?? "12345678",
      username: user['username'],
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
