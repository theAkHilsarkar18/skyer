import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'auth_textfield.dart';
import 'firebase_auth.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController txtEmail = TextEditingController();
    final TextEditingController txtPassword = TextEditingController();

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
            GestureDetector(
              onTap: () async {
                await signInUser(
                  context: context,
                  email: txtEmail.text,
                  password: txtPassword.text,
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
