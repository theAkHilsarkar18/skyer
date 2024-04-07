import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'auth_textfield.dart';
import 'firebase_auth.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController txtName = TextEditingController();
    final TextEditingController txtEmail = TextEditingController();
    final TextEditingController txtPassword = TextEditingController();
    final TextEditingController txtConfirmPassword = TextEditingController();

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TextScaler textScaler = MediaQuery.of(context).textScaler;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Icon(Icons.lock_outline,
                size: textScaler.scale(80), color: Colors.black45),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.03),
              child: Text(
                'Register here to get started',
                style: TextStyle(fontSize: textScaler.scale(15)),
              ),
            ),
            myTextFormField(
              controller: txtName,
              labelText: 'Name',
              height: height,
              width: width,
              context: context,
            ),
            myTextFormField(
              controller: txtEmail,
              labelText: 'Email',
              height: height,
              width: width,
              context: context,
            ),
            myTextFormField(
                obscureText: true,
                controller: txtPassword,
                labelText: 'Password',
                height: height,
                width: width,
                context: context),
            myTextFormField(
              context: context,
              obscureText: true,
              controller: txtConfirmPassword,
              labelText: 'Confirm Password',
              height: height,
              width: width,
            ),
            GestureDetector(
              onTap: () async {
                await signUpUser(
                  email: txtEmail.text,
                  context: context,
                  password: txtPassword.text,
                  requiredPassword: txtConfirmPassword.text,
                  name: txtName.text,
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: height * 0.05),
                height: height * 0.07,
                width: width * 0.95,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: textScaler.scale(16),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Text(
              'Already have an account?',
              style: TextStyle(
                fontSize: textScaler.scale(14),
                color: Colors.black,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Sign In',
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
