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

    Navigator.of(context).pushReplacementNamed('/nav');

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

  if (password != requiredPassword) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Passwords do not match !'),
    ));
    return;
  }

  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    if (context.mounted) Navigator.of(context).pop();
    // Navigator.of(context).pop();
    Navigator.of(context).pushReplacementNamed('/username');

  } on FirebaseAuthException catch (e) {
    print(e.code);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.code)));
    if (context.mounted) Navigator.of(context).pop();
  }
}
