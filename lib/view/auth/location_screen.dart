import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skyer/firebase_services/firebase_model.dart';
import 'package:skyer/firebase_services/firebase_services.dart';
import 'package:skyer/view/auth/sign_up.dart';

import 'auth_textfield.dart';
import 'firebase_auth.dart';

TextEditingController? txtCity;
TextEditingController? txtCountry;

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    firebaseServices = FirebaseServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    txtCity = TextEditingController(text: 'Surat');
    txtCountry = TextEditingController(text: 'India');

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TextScaler textScaler = MediaQuery.of(context).textScaler;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Location'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Icon(Icons.person,
                size: textScaler.scale(80), color: Colors.black45),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.03),
              child: Text(
                'Set your location',
                style: TextStyle(fontSize: textScaler.scale(15)),
              ),
            ),
            myTextFormField(
              context: context,
              obscureText: false,
              controller: txtCity!,
              labelText: 'City',
              height: height,
              width: width,
            ),
            myTextFormField(
              context: context,
              obscureText: false,
              controller: txtCountry!,
              labelText: 'Country',
              height: height,
              width: width,
            ),
            GestureDetector(
              onTap: () async {
                userModel = UserModel.set(
                  username: txtName!.text,
                  email: txtEmail!.text,
                  password: txtPassword!.text,
                  city: txtCity!.text,
                  country: txtCountry!.text,
                  followers: [],
                  following: [],
                  posts: [],
                  about: 'this is for about your self..',
                  name: txtName!.text,
                  profileBanner: 'https://images.pexels.com/photos/38568/apple-imac-ipad-workplace-38568.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  profileImg: 'https://media.licdn.com/dms/image/D4D03AQH9iZq7oUyTKA/profile-displayphoto-shrink_200_200/0/1711671228423?e=1717632000&v=beta&t=Qmqf6YydjBPFhVT2xvTNXnhNvvM4HZuhwmgHb3qj5A8',
                );
                firebaseServices!.createUser(
                  name: txtName!.text,
                  profileBanner: 'https://images.pexels.com/photos/38568/apple-imac-ipad-workplace-38568.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  profileImg: 'https://media.licdn.com/dms/image/D4D03AQH9iZq7oUyTKA/profile-displayphoto-shrink_200_200/0/1711671228423?e=1717632000&v=beta&t=Qmqf6YydjBPFhVT2xvTNXnhNvvM4HZuhwmgHb3qj5A8',
                  username: txtName!.text,
                    email: FirebaseAuth.instance.currentUser!.email!,
                    password: txtPassword!.text,
                    city: txtCity!.text,
                    country: txtCountry!.text,
                    followers: [],
                    following: [],
                    posts: [],

                );
                Navigator.pushNamed(context, '/nav');
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
