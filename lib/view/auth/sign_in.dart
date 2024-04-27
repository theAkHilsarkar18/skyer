import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:skyer/firebase_services/firebase_model.dart';
import 'package:skyer/firebase_services/firebase_services.dart';

import 'auth_provider.dart';
import 'auth_textfield.dart';
import 'firebase_auth.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  void initState() {
    // TODO: implement initState
    firebaseServices = FirebaseServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log("build method is loaded !");
    SignInProvider signInProviderTrue = Provider.of(context, listen: true);
    SignInProvider signInProviderFalse = Provider.of(context, listen: false);

    signInProviderFalse.getDataInSharedPreference();

    final TextEditingController txtEmail =
        TextEditingController(text: signInProviderTrue.email);
    final TextEditingController txtPassword =
        TextEditingController(text: signInProviderTrue.password);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TextScaler textScaler = MediaQuery.of(context).textScaler;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sign In'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Icon(Icons.lock_outline,
                size: textScaler.scale(80), color: Colors.black45),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.03),
              child: Text(
                'Sign here to get started',
                style: TextStyle(fontSize: textScaler.scale(15)),
              ),
            ),
            myTextFormField(
              controller: txtEmail,
              context: context,
              labelText: 'Email',
              height: height,
              width: width,
            ),
            myTextFormField(
              context: context,
              obscureText: true,
              controller: txtPassword,
              labelText: 'Password',
              height: height,
              width: width,
            ),
            // todo checkbox for remember me
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Remember me',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Consumer<SignInProvider>(
                  builder: (context, signInProvider, child) => Checkbox(
                    activeColor: Colors.black,
                    value: signInProvider.isCheckForRemember,
                    onChanged: (value) {
                      signInProvider.checkRememberBox(value!);
                      signInProvider.setDataInSharedPreference(
                        email: txtEmail.text,
                        password: txtPassword.text,
                      );
                    },
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () async {
                await signInUser(
                  context: context,
                  email: txtEmail.text,
                  password: txtPassword.text,
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: height * 0.03),
                height: height * 0.07,
                width: width * 0.95,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: textScaler.scale(16),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Text(
              'Don\'t have an account?',
              style: TextStyle(
                fontSize: textScaler.scale(14),
                color: Colors.black,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sign_up');
              },
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: textScaler.scale(14),
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
