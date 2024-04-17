import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> signInUser({
  required String email,
  required BuildContext context,
  required String password,
}) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  } on FirebaseException catch (e) {
    print(e.code);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.code)));
  }
}

Future<void> signOutUser() async {
  await FirebaseAuth.instance.signOut();
}

Future<void> signUpUser({
  required String email,
  required BuildContext context,
  required String password,
  required String requiredPassword,
  required String name,
}) async {
  showDialog(
    context: context,
    builder: (context) => const Center(child: CircularProgressIndicator()),
  );

  if (email.isEmpty ||
      password.isEmpty ||
      name.isEmpty ||
      requiredPassword.isEmpty) {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.of(context).pop();
        SnackBar snackBar = const SnackBar(
          content: Text("Please fill all the fields !"),
          backgroundColor: Colors.black,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(8),
          dismissDirection: DismissDirection.horizontal,
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  } else {
    if (password != requiredPassword) {
      Future.delayed(
        const Duration(seconds: 2),
        () {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Passwords do not match !'),
              backgroundColor: Colors.black,
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.all(8),
              dismissDirection: DismissDirection.horizontal,
            ),
          );
          return;
        },
      );
    } else {
      Future.delayed(
        const Duration(seconds: 2),
        () async {
          Navigator.pop(context);
          try {
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: email, password: password);
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed('/username');
          } on FirebaseAuthException catch (e) {
            log(e.code);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(e.code),
                backgroundColor: Colors.black,
                behavior: SnackBarBehavior.floating,
                margin: const EdgeInsets.all(8),
                dismissDirection: DismissDirection.horizontal,
              ),
            );
          }
        },
      );
    }
  }
}
