// ignore_for_file: avoid_print

// import 'dart:html';

import 'package:chat_app_firebase/models/user_model.dart';
import 'package:chat_app_firebase/pages/signupPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void checkValues() {
    String email = emailController.text.trim();
    String password = passController.text.trim();

    if (email == "" || password == "") {
      print("please fill the details");
    } else {
      logIn(email, password);
    }
  }

  void logIn(String email, String pass) async {
    UserCredential? credential;

    try {
      credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
    } catch (ex) {
      print(ex.toString());
    }

    if (credential != null) {
      String uid = credential.user!.uid;

      DocumentSnapshot userData =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();

      UserModel userModel =
          UserModel.fromMap(userData.data() as Map<String, dynamic>);

      //go to home page
      print("Login successfullllllll");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Chu Chapad",
                style: GoogleFonts.lato(
                    fontSize: 40,
                    color: Colors.deepPurpleAccent,
                    fontWeight: FontWeight.bold),
              ),
              const TextField(
                decoration: InputDecoration(labelText: "Email Address"),
              ),
              const SizedBox(
                height: 10,
              ),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
              ),
              const SizedBox(
                height: 40,
              ),
              CupertinoButton(
                onPressed: () {},
                color: Colors.deepPurpleAccent,
                child: const Text("Login"),
              )
            ],
          ),
        )),
      )),
      bottomNavigationBar: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Dont have an account ?",
              style: GoogleFonts.lato(fontSize: 20),
            ),
            CupertinoButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignUp();
                }));
              },
              child: Text("Signup"),
            )
          ],
        ),
      ),
    );
  }
}
