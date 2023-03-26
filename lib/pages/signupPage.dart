import 'package:chat_app_firebase/models/user_model.dart';
import 'package:chat_app_firebase/pages/completeProfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController cpassController = TextEditingController();

  void checkValues() {
    String email = emailController.text.trim();
    String pass = passController.text.trim();
    String cpass = cpassController.text.trim();

    if (email == "" || pass == "" || cpass == "") {
      // ignore: avoid_print
      print("fill all details");
    } else if (cpass != pass) {
      // ignore: avoid_print
      print("passwords do not match");
    } else {
      signUp(email, pass);
    }
  }

  void signUp(String email, String pass) async {
    UserCredential? credential;

    try {
      credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass);
    } on FirebaseAuthException catch (exception) {
      // ignore: avoid_print
      print(exception.code
          .toString()); // exception ka code bhi print ho jayega jisse usko track kar ske
    }

    // agar user ban gya-->> matlab credential null nahi hoga ..
    // to yha se authentication ka kaam khtm haii.. yha firebase cloudstore ka kaam
    // suru hota hai --->> yaha ham ek field (ek document) banayege apne user ke liye

    if (credential != null) {
      String uid = credential
          .user!.uid; // user ki unique id firebase khud he bana deta hai

      UserModel newUser = UserModel(
        uid: uid,
        email: email,
        fullname: "",
        profilepic: "",
      );
      await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .set(newUser.tomap())
          .then((value) {
        print("user created");
      });
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
                "fck off",
                style: GoogleFonts.lato(
                    fontSize: 40,
                    color: Colors.deepPurpleAccent,
                    fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "Email Address"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: passController,
                obscureText: true,
                decoration: const InputDecoration(labelText: "Password"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: cpassController,
                obscureText: true,
                decoration:
                    const InputDecoration(labelText: "Confirm Password"),
              ),
              const SizedBox(
                height: 40,
              ),
              CupertinoButton(
                onPressed: () {
                  checkValues(); 
                },
                color: Colors.deepPurpleAccent,
                child: const Text("Sign up"),
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
              "Already have an account ?",
              style: GoogleFonts.lato(fontSize: 20),
            ),
            CupertinoButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
