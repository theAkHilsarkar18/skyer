import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_model.dart';

FirebaseServices? firebaseServices;
Stream<DocumentSnapshot>? userStreamData;

class FirebaseServices
{

  CollectionReference users = FirebaseFirestore.instance.collection("users");

  Future<void> createUser({
    required String username,
    required String email,
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

  Future<void> readUser({required String email,})
  async {
    DocumentReference<Map<String, dynamic>> documentReference = FirebaseFirestore.instance.collection("users").doc(email);
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await documentReference.get();
    if(documentSnapshot.exists)
      {
        Map userData = documentSnapshot.data()!;
        print("\n\n");
        print("\n\n" + userData.toString()+"\n\n");
        userModel = UserModel(userData);
        print("\n---------------------------------------------------------${userModel!.name!}");
      }
    else
      {
        print("\n\n---------------------------------doc not exist-------------------------------------\n\n");
      }
  }


}
