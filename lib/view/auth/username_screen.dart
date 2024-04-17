import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skyer/firebase_services/firebase_model.dart';
import 'package:skyer/firebase_services/firebase_services.dart';

import 'auth_textfield.dart';
import 'firebase_auth.dart';


TextEditingController? txtUsername = TextEditingController();

class UsernameScreen extends StatefulWidget {
  const UsernameScreen({super.key});

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {

  @override
  void initState() {
    // TODO: implement initState
    firebaseServices = FirebaseServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TextScaler textScaler = MediaQuery.of(context).textScaler;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Set Username'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Icon(Icons.person,
                size: textScaler.scale(80), color: Colors.black45),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.03),
              child: Text(
                'Set a unique username',
                style: TextStyle(fontSize: textScaler.scale(15)),
              ),
            ),

            myTextFormField(
              context: context,
              obscureText: false,
              controller: txtUsername!,
              labelText: 'Username',
              height: height,
              width: width,
            ),
            GestureDetector(
              onTap: () async {
                Navigator.pushNamed(context, '/location');
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
                  'Next',
                  style: TextStyle(
                    fontSize: textScaler.scale(16),
                    color: Colors.white,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
