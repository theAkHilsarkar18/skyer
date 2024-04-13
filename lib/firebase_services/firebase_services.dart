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
    });
  }

  Stream<DocumentSnapshot> readUser({required String email})
  {
    userStreamData = users.doc(email).snapshots();
    return userStreamData!;
  }

  void readUserFromFirebase({required String email,})
  {
      DocumentReference docRef = FirebaseFirestore.instance.collection("users").doc(email);

      // asynchronously retrieve the document
      // ApiFuture<DocumentSnapshot> future = docRef.get();
      // future.get() blocks on response
      DocumentSnapshot document =docRef.get() as DocumentSnapshot<Object?>;
      // if (document.exists()) {
      // System.out.println("Document data: " + document.getData());
      // } else {
      // System.out.println("No such document!");

  }


}
