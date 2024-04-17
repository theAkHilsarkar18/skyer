import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_model.dart';

FirebaseServices? firebaseServices;
Stream<DocumentSnapshot>? userStreamData;

class FirebaseServices {
  CollectionReference users = FirebaseFirestore.instance.collection("users");

  Future<void> createUser({required UserModel userModel}) async {
    users.doc(userModel.email).set(userModel.toMap());
  }

  Stream<DocumentSnapshot> readUser({required String email}) {
    userStreamData = users.doc(email).snapshots();
    return userStreamData!;
  }

  void readUserFromFirebase({
    required String email,
  }) {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection("users").doc(email);

    // asynchronously retrieve the document
    // ApiFuture<DocumentSnapshot> future = docRef.get();
    // future.get() blocks on response
    DocumentSnapshot document = docRef.get() as DocumentSnapshot<Object?>;
    // if (document.exists()) {
    // System.out.println("Document data: " + document.getData());
    // } else {
    // System.out.println("No such document!");
  }
}
